import 'package:flutter/material.dart';
import './recipe_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecipeListContainer extends StatelessWidget {
  // final String id;
  final String title;
  final String ingredients;
  final String recipe;
  final String image;
  final String author;
  final String category;

  RecipeListContainer(
    this.title,
    this.ingredients,
    this.recipe,
    this.image,
    this.author,
    this.category,
  );

  void getRecipeDetail(
    BuildContext ctx,
  ) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RecipeDetail(title, ingredients, recipe, image, author, category);
    }));
  }

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
                          title,
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
                      child: TextButton(
                        onPressed: () => getRecipeDetail(context),
                        child: Text(
                          "View Recipe",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfffa4a0c),
                            fontSize: 17,
                          ),
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
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            imageUrl:
                                'https://www.kindacode.com/wp-content/uploads/2020/10/sample.jpg',
                          ),
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
