import 'package:flutter/material.dart';

import 'package:raaz_e_rasoi/widgets/bottom_navbar.dart';
import './widgets/signup.dart';
import './widgets/login.dart';
import './widgets/recipe_detail.dart';
import './widgets/recipe_list.dart';
import './widgets/profile.dart';

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
      home: Scaffold(
        body: Profile(),
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
