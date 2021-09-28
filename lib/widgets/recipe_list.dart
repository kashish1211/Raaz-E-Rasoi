import 'dart:developer';

import 'package:flutter/material.dart';
import './bottom_navbar.dart';
import 'category_model.dart';
import 'recipe_model.dart';
import './recipe_list_container.dart';

class RecipeList extends StatefulWidget {
  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  var _selectedCategory = 'c1';
  var _selectedCategoryName = 'Italian';
  void _onCategoryTap(String id, String name) {
    setState(() {
      _selectedCategory = id;
      _selectedCategoryName = name;
    });
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
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: DUMMY_RECIPES
                          .map(
                            (recData) =>
                                recData.category == _selectedCategoryName
                                    ? RecipeListContainer(
                                        recData.id,
                                        recData.title,
                                        recData.image,
                                      )
                                    : Container(),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
