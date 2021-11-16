import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/recipe_detail.dart';

class FavouriteList extends StatefulWidget {
  var email = "";
  FavouriteList(this.email);

  @override
  _FavouriteListState createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void getRecipeDetail(BuildContext ctx, String id, String title,
      String ingredients, String recipe, String image, String category) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RecipeDetail(
          id, title, ingredients, recipe, image, widget.email, category);
    }));
  }

  var uid = "";
  var isNull = false;
  var _selectedRecipes = [];
  var _selectedIds = [];
  List favouriteList = [];

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('recipes');

  Future<Object> fetchAllFavourite() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    favouriteList = documentSnapshot.get('favourites');
    QuerySnapshot querySnapshot = await _collectionRef
        .where(
          FieldPath.documentId,
          whereIn: favouriteList,
        )
        .get();
    _selectedRecipes = querySnapshot.docs.map((doc) => doc.data()).toList();

    _selectedIds = querySnapshot.docs.map((doc) => doc.id).toList();
    isNull = _selectedRecipes.length == 0;

    return _selectedRecipes;
  }

  void _removefavourite(BuildContext ctx, recipe_id) {
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'favourites': FieldValue.arrayRemove([recipe_id]),
    }).then(
      (_) => setState(
        () {
          if (_selectedRecipes.length == 1) {
            isNull = true;
          }
          print("removeeddd.. ");
          ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(
              content: Text("Removed from favourites."),
              backgroundColor: Colors.red,
            ),
          );
        },
      ),
    );
  }

  void getUID() {
    final User? user = auth.currentUser;
    uid = user!.uid;
    fetchAllFavourite();
  }

  @override
  void initState() {
    super.initState();
    fetchAllFavourite();
    // print("Hererere");
  }

  @override
  Widget build(BuildContext context) {
    getUID();
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: FutureBuilder<Object>(
        future: fetchAllFavourite(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) if (!isNull)
            return Container(
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    height: queryData.size.height * 0.15,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: EdgeInsets.symmetric(
                          vertical: queryData.size.height * 0.01,
                          horizontal: queryData.size.width * 0.09),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 45,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(
                                      color: Color(0xfffa4a0c)),
                              imageUrl: _selectedRecipes[index]['RecipeImage'],
                            ),
                          ),
                        ),
                        title: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _selectedRecipes[index]['Title'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () => getRecipeDetail(
                                  context,
                                  _selectedIds[index],
                                  _selectedRecipes[index]['Title'],
                                  _selectedRecipes[index]['Ingredients'],
                                  _selectedRecipes[index]['Recipe'],
                                  _selectedRecipes[index]['RecipeImage'],
                                  _selectedRecipes[index]['Category'],
                                ),
                                child: Text(
                                  "View Recipe",
                                  style: TextStyle(
                                    color: Color(0xfffa4a0c),
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () =>
                              _removefavourite(context, _selectedIds[index]),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _selectedRecipes.length,
              ),
            );
          else
            return Container(
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/hungry.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          else
            return Container(
              margin: EdgeInsets.only(
                top: queryData.size.height * 0.13,
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xfffa4a0c),
                ),
              ),
            );
        },
      ),
    );
  }
}
