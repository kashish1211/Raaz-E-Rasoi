import 'package:flutter/material.dart';

import './bottom_navbar.dart';

class RecipeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(top: queryData.size.height * 0.07),
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
                      child: Image.asset(
                        'assets/images/demodish.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: queryData.size.height * 0.55,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: queryData.size.height * 0.03),
                          Text(
                            "Tomato Veggie",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(height: queryData.size.height * 0.015),
                          Text(
                            "Author ",
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
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                " 1. Salt \n 2. Cold Water \n 3. Sugar \n 4. Lemon \n 5. Chat Masala",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                              ),
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
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                " 1. Salt \n 2. Cold Water \n 3. Sugar \n 4. Lemon \n 5. Chat Masala",
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
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
