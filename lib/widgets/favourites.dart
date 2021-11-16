import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/profile_list.dart';

import 'favourite_list.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var uid = "";
  var email = "";
  void getUID() {
    final User? user = auth.currentUser;
    uid = user!.uid;
    email = user.email!;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: queryData.size.width * 0.08,
              top: queryData.size.height * 0.07,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Favourites",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(height: queryData.size.height * 0.03),
          Container(
            height: queryData.size.height * 0.73,
            child: FavouriteList(email),
          ),
        ],
      ),
    );
  }
}
