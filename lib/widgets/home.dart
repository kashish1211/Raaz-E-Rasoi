import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './recipe_list.dart';
import './profile.dart';
import './add_recipe.dart';
import './authenticate/header.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static List _widgetOptions = [
    RecipeList(),
    Profile(),
    AddRecipe(),
    Center(child: CircularProgressIndicator(color: Color(0xfffa4a0c))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return Header();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex, // this will be set when a new tab is tapped
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xfffa4a0c),
        onTap: _onItemTapped,
        elevation: 5,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_sharp),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
