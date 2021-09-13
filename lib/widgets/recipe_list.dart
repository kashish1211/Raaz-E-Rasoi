import 'package:flutter/material.dart';
import './bottom_navbar.dart';
import './recipe_list_container.dart';

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
                    fontSize: 34,
                  ),
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
            SizedBox(height: queryData.size.height * 0.08),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeListContainer('grill'),
                    RecipeListContainer('demodish'),
                    RecipeListContainer('grill'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
