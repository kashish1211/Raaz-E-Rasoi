import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/recipe_detail.dart';
import './add_recipe.dart';

class ProfileList extends StatefulWidget {
  var email = "";
  ProfileList(this.email);

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  void getRecipeDetail(BuildContext ctx, String title, String ingredients,
      String recipe, String image, String category) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RecipeDetail(
          title, ingredients, recipe, image, widget.email, category);
    }));
  }

  void addRecipe(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return AddRecipe();
    }));
  }

  var _selectedRecipes = [];
  var _selectedIds = [];
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('recipes');
  void deleteRecipe(String id, BuildContext ctx) {
    print(id);
    final collection = FirebaseFirestore.instance.collection('recipes');
    collection
        .doc(id) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) => print('Deleted'))
        .catchError((error) => print('Delete failed: $error'));
    setState(() {
      print("deleted");
    });

    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text("Your recipe has been deleted."),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<Object> getData() async {
    // Get docs from collection reference

    QuerySnapshot querySnapshot =
        await _collectionRef.where('Author', isEqualTo: widget.email).get();

    // Get data from docs and convert map to List
    _selectedRecipes = querySnapshot.docs.map((doc) => doc.data()).toList();
    _selectedIds = querySnapshot.docs.map((doc) => doc.id).toList();
    print(_selectedRecipes);
    print(_selectedIds);
    return _selectedRecipes;
  }

  @override
  void initState() {
    super.initState();
    getData();
    // print("Hererere");
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: FutureBuilder<Object>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.done) if (_selectedRecipes.length != 0)
            return Container(
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
                              deleteRecipe(_selectedIds[index], context),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _selectedRecipes.length,
              ),
            );
          else
            return ListView(
              children: [
                Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/hungry.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                    TextButton(
                      onPressed: () => addRecipe(context),
                      child: Text(
                        "Click here to add a recipe",
                        style: TextStyle(
                          color: Color(0xffff460a),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
