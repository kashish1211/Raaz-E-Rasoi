import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/authenticate/header.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var email = "";
  void getEmail() {
    final User? user = auth.currentUser;
    email = user!.email!;
  }

  var _recipeName = "";
  var _recipeCategory = "Choose a category";
  var _recipe = "";
  var _recipeIngredients = [];
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  void _trySubmit(BuildContext ctx) {
    setState(() {
      _isLoading = true;
    });
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      getEmail();
      FirebaseFirestore.instance
          .collection('recipes')
          .doc(email)
          .collection(_recipeName)
          .add(
        {
          'Title': _recipeName,
          'Author': email,
          'Category': _recipeCategory,
          'Ingredients': _recipeIngredients,
          'Recipe': _recipe,
        },
      );

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text("Your recipe has been added. Seems Delicious! "),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text('Error occured. Please Try Again!'),
          backgroundColor: Colors.red,
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  File? _pickedImage;

  void _pickImage() async {
    final _pickedImageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    File file = File(_pickedImageFile!.path);

    setState(() {
      _pickedImage = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: queryData.size.height * 1.35,
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
                        SizedBox(height: queryData.size.height * 0.04),
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
                            'Indian',
                            'Mexican',
                            'Italian',
                            'Chinese',
                            'Cocktails',
                            'Starters',
                            'Deserts',
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
                        SizedBox(height: queryData.size.height * 0.04),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            icon: Icon(
                              Icons.image,
                              color: const Color(0xfffa4a0c),
                            ),
                            label: Text(
                              'Recipe Image',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 18,
                              ),
                            ),
                            onPressed: _pickImage,
                          ),
                        ),
                        SizedBox(height: queryData.size.height * 0.02),
                        if (_pickedImage != null)
                          Image.file(
                            _pickedImage!,
                            height: queryData.size.height * 0.3,
                            width: queryData.size.width * 0.4,
                            // fit: BoxFit.fitHeight,
                          ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //           image: FileImage(_pickedImage!))),
                        // ),
                        SizedBox(height: queryData.size.height * 0.04),
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
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
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
      ),
    );
  }
}
