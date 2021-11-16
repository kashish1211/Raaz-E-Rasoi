import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/recipe_detail.dart';

class SearchList extends StatefulWidget {
  final searchKey;
  SearchList(this.searchKey);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  var _selectedRecipes = [];

  var _selectedIds = [];

  var isNull = false;

  void getRecipeDetail(
      BuildContext ctx,
      String id,
      String title,
      String ingredients,
      String recipe,
      String author,
      String image,
      String category) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RecipeDetail(
          id, title, ingredients, recipe, image, author, category);
    }));
  }

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('recipes');

  Future<Object> fetchResults() async {
    QuerySnapshot querySnapshot = await _collectionRef
        .where('Title', isGreaterThanOrEqualTo: widget.searchKey)
        .where('Title', isLessThanOrEqualTo: widget.searchKey + '\uf8ff')
        .get();
    _selectedRecipes = querySnapshot.docs.map((doc) => doc.data()).toList();

    _selectedIds = querySnapshot.docs.map((doc) => doc.id).toList();
    if (_selectedRecipes.length == 0) {
      isNull = true;
    }
    return _selectedRecipes;
  }

  @override
  void initState() {
    super.initState();
    fetchResults();
    // print("Hererere");
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: FutureBuilder<Object>(
        future: fetchResults(),
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
                                  _selectedRecipes[index]['Author'],
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
