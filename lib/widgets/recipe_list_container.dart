import 'package:flutter/material.dart';

class RecipeListContainer extends StatelessWidget {
  final String dish;
  RecipeListContainer(this.dish);
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      width: queryData.size.width * 0.6,
      height: queryData.size.height * 0.5,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: queryData.size.width * 0.04,
                    vertical: queryData.size.height * 0.02),
                width: queryData.size.width * 0.6,
                height: queryData.size.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 60,
                      offset: Offset(0, 30),
                    ),
                  ],
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(
                  top: queryData.size.height * 0.1,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: queryData.size.width * 0.5,
                      height: queryData.size.height * 0.09,
                      child: Opacity(
                        opacity: 0.90,
                        child: Text(
                          "Veggie tomato mix tomato mix",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: queryData.size.width * 0.35,
                      height: queryData.size.height * 0.05,
                      child: Text(
                        "View Recipe",
                        textAlign: TextAlign.center,
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
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: queryData.size.width * 0.45,
                height: queryData.size.height * 0.25,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: queryData.size.height * 0.045),
                      width: queryData.size.width * 0.75,
                      height: queryData.size.height * 0.35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: FittedBox(
                        child: Image.asset(
                          'assets/images/$dish.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
