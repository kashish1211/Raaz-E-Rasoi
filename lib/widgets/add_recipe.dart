import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/authenticate/header.dart';

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  var _recipeName = "";
  var _recipeCategory = "Choose a category";
  var _recipe = "";
  var _recipeIngredients = [];
  final _formKey = GlobalKey<FormState>();

  void _trySubmit(BuildContext ctx) {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      print(_recipeName);
      print(_recipeCategory);
      print(_recipe);
      print(_recipeIngredients);
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return ListView(
      children: [
        Container(
          height: queryData.size.height,
          decoration: BoxDecoration(
            color: Color(0xfff2f2f2),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: queryData.size.width * 0.08,
                  top: queryData.size.height * 0.07,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Add New Recipe",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(height: queryData.size.height * 0.03),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: queryData.size.width * 0.1,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: queryData.size.height * 0.08),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid Title!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Title of your Recipe',
                          labelStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xfffa4a0c)),
                          ),
                        ),
                        onSaved: (value) {
                          _recipeName = value!;
                        },
                      ),
                      SizedBox(height: queryData.size.height * 0.04),
                      DropdownButtonFormField<String>(
                        value: _recipeCategory,
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == "Choose a category") {
                            return 'Enter valid category';
                          }
                          return null;
                        },
                        items: <String>[
                          'Choose a category',
                          'Android',
                          'IOS',
                          'Flutter',
                          'Node',
                          'Java',
                          'Python',
                          'PHP',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _recipeCategory = value!;
                          });
                        },
                      ),
                      SizedBox(height: queryData.size.height * 0.04),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Proper Ingredients';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Recipe Ingredients',
                          labelStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xfffa4a0c)),
                          ),
                        ),
                        onSaved: (value) {
                          _recipeIngredients = value!.split(",");
                        },
                      ),
                      SizedBox(height: queryData.size.height * 0.04),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Proper Steps';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Recipe Steps',
                          labelStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xfffa4a0c)),
                          ),
                        ),
                        onSaved: (value) {
                          _recipe = value!;
                        },
                      ),
                      SizedBox(height: queryData.size.height * 0.08),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffff460a),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () => _trySubmit(context),
                        child: Text(
                          "Add Recipe",
                          style: TextStyle(
                            fontSize: 22,
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
    );
  }
}
