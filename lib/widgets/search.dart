import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/search_list.dart';

class Search extends StatelessWidget {
  final searchKey;
  Search(this.searchKey);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: queryData.size.height * 0.04,
                  left: queryData.size.width * 0.04),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    iconSize: 35,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: queryData.size.width * 0.04,
                top: queryData.size.height * 0.04,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Search Results",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: queryData.size.height * 0.03),
            Container(
              height: queryData.size.height * 0.43,
              child: SearchList(searchKey),
            ),
          ],
        ),
      ),
    );
  }
}
