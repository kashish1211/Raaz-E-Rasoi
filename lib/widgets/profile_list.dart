import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  List recipes = [
    ['Tomato Vegiee', 'assets/images/grill.png'],
    ['Not tomato vegie', 'assets/images/demodish.png']
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Container(
          height: queryData.size.height * 0.15,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            margin: EdgeInsets.symmetric(
                vertical: queryData.size.height * 0.01,
                horizontal: queryData.size.width * 0.09),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: Image.asset(recipes[index][1]),
              ),
              title: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      recipes[index][0],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View Recipe",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => {},
              ),
            ),
          ),
        );
      },
      itemCount: recipes.length,
    );
  }
}
