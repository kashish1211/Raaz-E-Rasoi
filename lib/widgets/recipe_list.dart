import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/search.dart';
import './bottom_navbar.dart';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: queryData.size.height * 0.08,
          left: queryData.size.width * 0.08,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Maa Ka Swaad \nAb Aapke Haath...",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                ),
              ),
            ),
            SizedBox(height: queryData.size.height * 0.05),
            Container(
              padding: EdgeInsets.only(right: queryData.size.width * 0.06),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Indian",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Chinese",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Italian",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Indian",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Indian",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Indian",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Indian",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Indian",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: queryData.size.width * 0.02),
                      child: Text(
                        "Indian",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 17,
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
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
