import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './bottom_navbar.dart';
import '../models/recipe.dart';
// import './recipe_modal.dart';

class RecipeDetail extends StatefulWidget {
  final String id;
  final String title;
  final String ingredients;
  final String recipe;
  final String image;
  final String author;
  final String category;

  RecipeDetail(
    this.id,
    this.title,
    this.ingredients,
    this.recipe,
    this.image,
    this.author,
    this.category,
  );

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  var favourite = false;
  var uid = "";
  var list_favourites = [];

  final FirebaseAuth auth = FirebaseAuth.instance;

  void _addfavourite(BuildContext ctx) {
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'favourites': FieldValue.arrayUnion([widget.id]),
    });

    setState(() {
      favourite = true;
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text("Added to favourites."),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  void _removefavourite(BuildContext ctx) {
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'favourites': FieldValue.arrayRemove([widget.id]),
    });
    setState(() {
      favourite = false;
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text("Removed from favourites."),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  void getUID() {
    final User? user = auth.currentUser;
    uid = user!.uid;
    fetchAllFavourite();
  }

  void fetchAllFavourite() async {
    List favouriteList = [];
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    favouriteList = documentSnapshot.get('favourites');
    setState(() {
      favourite = favouriteList.contains(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    getUID();
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
                                  CircularProgressIndicator(
                                      color: Color(0xfffa4a0c)),
                              imageUrl: widget.image,
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
                              widget.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(height: queryData.size.height * 0.015),
                            Text(
                              widget.author,
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
                                children: widget.ingredients
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
                                  widget.recipe,
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
        floatingActionButton: (favourite)
            ? FloatingActionButton(
                onPressed: () => _removefavourite(context),
                child: Icon(
                  Icons.favorite,
                  color: Color(0xffff460a),
                ),
                backgroundColor: Colors.white,
              )
            : FloatingActionButton(
                onPressed: () => _addfavourite(context),
                child: Icon(
                  Icons.favorite_border,
                  color: Color(0xffff460a),
                ),
                backgroundColor: Colors.white,
              ));
  }
}
