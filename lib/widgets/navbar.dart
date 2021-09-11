import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final bool detail;
  final bool list;

  Navbar(this.detail, this.list);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.07,
          left: MediaQuery.of(context).size.width * 0.06,
          right: MediaQuery.of(context).size.width * 0.06,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!list)
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
            if (detail)
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.favorite_outline,
                ),
              ),
            if (list)
              IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.add,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
