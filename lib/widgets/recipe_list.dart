import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'category_model.dart';
import './recipe_list_container.dart';
import './add_recipe.dart';
import 'dart:async';

class RecipeList extends StatefulWidget {
  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  var _selectedIds = [];

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('recipes');

  var _selectedCategory = 'c1';
  var _selectedCategoryName = 'Italian';
  var _selectedRecipes = [];

  void _onCategoryTap(String id, String name) {
    setState(() {
      _selectedCategory = id;
      _selectedCategoryName = name;
      getData(_selectedCategoryName);
    });
  }

  void addRecipe(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return AddRecipe();
    }));
  }

  Future<Object> getData(String category) async {
    // Get docs from collection reference

    QuerySnapshot querySnapshot =
        await _collectionRef.where('Category', isEqualTo: category).get();

    // Get data from docs and convert map to List
    _selectedRecipes = querySnapshot.docs.map((doc) => doc.data()).toList();
    _selectedIds = querySnapshot.docs.map((doc) => doc.id).toList();
    return _selectedRecipes;
  }

  @override
  void initState() {
    super.initState();
    getData(_selectedCategoryName);
    // var _now = DateTime.now().second.toString();

    // // defines a timer
    // var _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
    //   setState(() {
    //     _now = DateTime.now().second.toString();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: queryData.size.height * 0.055,
              //
            ),
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: queryData.size.width * 0.08,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Maa Ka Swaad \nAb Aapke Haath...",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: queryData.size.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: queryData.size.width * 0.13),
                  child: TextField(
                    cursorColor: const Color(0xfffa4a0c),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffa4a0c)),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      hintText: 'Search Recipes',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(height: queryData.size.height * 0.03),
                Container(
                  padding: EdgeInsets.only(
                      right: queryData.size.width * 0.06,
                      left: queryData.size.width * 0.06),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: DUMMY_CATEGORIES
                          .map(
                            (catData) => Container(
                              decoration: BoxDecoration(
                                border: (_selectedCategory == catData.id)
                                    ? Border(
                                        bottom: BorderSide(
                                          color: Color(0xfffa4a0c),
                                          width: 4.0, // Underline thickness
                                        ),
                                      )
                                    : Border(),
                              ),
                              margin: EdgeInsets.only(
                                left: queryData.size.width * 0.01,
                                right: queryData.size.width * 0.01,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: queryData.size.width * 0.02,
                                ),
                                child: TextButton(
                                  onPressed: () => _onCategoryTap(
                                      catData.id, catData.category),
                                  child: Text(
                                    catData.category,
                                    style: TextStyle(
                                      color: _selectedCategory == catData.id
                                          ? Color(0xfffa4a0c)
                                          : Color(0xff99999d),
                                      fontSize: _selectedCategory == catData.id
                                          ? 17
                                          : 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(height: queryData.size.height * 0.04),
                FutureBuilder<Object>(
                  future: getData(_selectedCategoryName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.done) if (_selectedRecipes.length != 0)
                      return Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _selectedRecipes
                                .asMap()
                                .map(
                                  (i, recData) => MapEntry(
                                    i,
                                    RecipeListContainer(
                                      _selectedIds[i],
                                      recData['Title'].toString(),
                                      recData['Ingredients'].toString(),
                                      recData['Recipe'].toString(),
                                      recData['RecipeImage'].toString(),
                                      recData['Author'].toString(),
                                      recData['Category'].toString(),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                        ),
                      );
                    else
                      return Column(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
