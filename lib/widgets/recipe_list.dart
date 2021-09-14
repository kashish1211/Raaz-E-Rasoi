import 'package:flutter/material.dart';
import './bottom_navbar.dart';
import './recipe_list_container.dart';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: queryData.size.height * 0.055,
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
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: queryData.size.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: queryData.size.width * 0.13),
                  child: TextField(
                    cursorColor: const Color(0xfffa4a0c),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffa4a0c)),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      hintText: 'Search Recipes',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(height: queryData.size.height * 0.03),
                Container(
                  padding: EdgeInsets.only(
                      right: queryData.size.width * 0.06,
                      left: queryData.size.width * 0.06),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xfffa4a0c),
                                width: 4.0, // Underline thickness
                              ),
                            ),
                          ),
                          margin: EdgeInsets.only(
                            left: queryData.size.width * 0.01,
                            right: queryData.size.width * 0.01,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: queryData.size.width * 0.03,
                                right: queryData.size.width * 0.03,
                                bottom: queryData.size.height * 0.01),
                            child: Text(
                              "Indian",
                              style: TextStyle(
                                color: Color(0xfffa4a0c),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: queryData.size.width * 0.01,
                            right: queryData.size.width * 0.01,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: queryData.size.width * 0.03,
                                right: queryData.size.width * 0.03,
                                bottom: queryData.size.height * 0.01),
                            child: Text(
                              "Chinese",
                              style: TextStyle(
                                color: Color(0xff99999d),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: queryData.size.width * 0.01,
                            right: queryData.size.width * 0.01,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: queryData.size.width * 0.03,
                                right: queryData.size.width * 0.03,
                                bottom: queryData.size.height * 0.01),
                            child: Text(
                              "Italian",
                              style: TextStyle(
                                color: Color(0xff99999d),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: queryData.size.width * 0.01,
                            right: queryData.size.width * 0.01,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: queryData.size.width * 0.03,
                                right: queryData.size.width * 0.03,
                                bottom: queryData.size.height * 0.01),
                            child: Text(
                              "Mexican",
                              style: TextStyle(
                                color: Color(0xff99999d),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: queryData.size.width * 0.01,
                            right: queryData.size.width * 0.01,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: queryData.size.width * 0.03,
                                right: queryData.size.width * 0.03,
                                bottom: queryData.size.height * 0.01),
                            child: Text(
                              "Cocktails",
                              style: TextStyle(
                                color: Color(0xff99999d),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: queryData.size.width * 0.01,
                            right: queryData.size.width * 0.01,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: queryData.size.width * 0.03,
                                right: queryData.size.width * 0.03,
                                bottom: queryData.size.height * 0.01),
                            child: Text(
                              "Indian",
                              style: TextStyle(
                                color: Color(0xff99999d),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: queryData.size.width * 0.01,
                            right: queryData.size.width * 0.01,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: queryData.size.width * 0.03,
                                right: queryData.size.width * 0.03,
                                bottom: queryData.size.height * 0.01),
                            child: Text(
                              "Indian",
                              style: TextStyle(
                                color: Color(0xff99999d),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: queryData.size.width * 0.01,
                            right: queryData.size.width * 0.01,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: queryData.size.width * 0.03,
                                right: queryData.size.width * 0.03,
                                bottom: queryData.size.height * 0.01),
                            child: Text(
                              "Indian",
                              style: TextStyle(
                                color: Color(0xff99999d),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: queryData.size.height * 0.04),
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
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
