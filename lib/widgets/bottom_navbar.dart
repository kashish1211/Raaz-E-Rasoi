import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/profile.dart';
import 'package:raaz_e_rasoi/widgets/recipe_detail.dart';
import 'package:raaz_e_rasoi/widgets/recipe_list.dart';

class BottomNavbar extends StatefulWidget {
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    RecipeList(),
    Profile(),
    // RecipeDetail("r1"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
          // BottomNavigationBarItem(
          //   icon: new Icon(Icons.mail),
          //   title: new Text('Favorites'),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.add),
          //   title: Text('Recipe Detail'),
          // ),
        ],
      ),
    );
  }
}
