import 'package:flutter/material.dart';

import './widgets/signup.dart';
import './widgets/login.dart';
import './widgets/recipe_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raaz-E-Rasoi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeDetail(),
    );
  }
}
