import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import './bottom_navbar.dart';
import '../models/recipe.dart';
// import './recipe_modal.dart';

class RecipeDetail extends StatelessWidget {
  // final String id;
  final String title;
  final String ingredients;
  final String recipe;
  final String image;
  final String author;
  final String category;

  RecipeDetail(
    // this.id,
    this.title,
    this.ingredients,
    this.recipe,
    this.image,
    this.author,
    this.category,
  );

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: queryData.size.height * 0.04,
                  left: queryData.size.width * 0.04),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    iconSize: 35,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: queryData.size.height * 0),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      // padding: EdgeInsets.only(top: queryData.size.height * 0.05),
                      constraints: const BoxConstraints(
                        minWidth: 200,
                        minHeight: 200,
                        maxWidth: 200,
                        maxHeight: 200,
                      ),
                      child: FittedBox(
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(color: Color(0xfffa4a0c)),
                            imageUrl:image
                                ,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: queryData.size.height * 0.59,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: queryData.size.height * 0.03),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(height: queryData.size.height * 0.015),
                          Text(
                            author,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0xffff460a),
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: queryData.size.height * 0.03),
                          Padding(
                            padding: EdgeInsets.only(
                              left: queryData.size.width * 0.06,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Ingredients",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: queryData.size.height * 0.03),
                          Padding(
                            padding: EdgeInsets.only(
                              left: queryData.size.width * 0.1,
                            ),
                            child: Column(
                              children: ingredients
                                  .split(",")
                                  .map(
                                    (recp) => Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "🌶 " + recp,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: queryData.size.height * 0.03),
                          Padding(
                            padding: EdgeInsets.only(
                              left: queryData.size.width * 0.06,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Recipe",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: queryData.size.height * 0.03),
                          Padding(
                            padding: EdgeInsets.only(
                              left: queryData.size.width * 0.1,
                              bottom: queryData.size.height * 0.05,
                              right: queryData.size.width * 0.1,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                recipe,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(
          Icons.favorite,
          color: Color(0xffff460a),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
