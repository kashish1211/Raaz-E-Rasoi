import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/authenticate/header.dart';
import 'package:raaz_e_rasoi/widgets/profile_list.dart';

class Profile extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var uid = "";
  var email = "";
  void getUID() {
    final User? user = auth.currentUser;
    uid = user!.uid;
    email = user.email!;
  }

  void _logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Header();
    }));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    getUID();
    return Material(
      child: Container(
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
                  "My profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: queryData.size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: queryData.size.width * 0.08,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Personal Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: queryData.size.width * 0.08,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Color(0xfffa4a0c),
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => _logout(context),
                    ),
                  ),
                ),
              ],
            ),

            // SizedBox(height: queryData.size.height * 0.03),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: queryData.size.height * 0.02,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: queryData.size.width * 0.122,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              height: queryData.size.height * 0.24,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: queryData.size.width * 1,
                    padding: EdgeInsets.only(
                      top: queryData.size.height * 0.02,
                      bottom: queryData.size.height * 0.01,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: FutureBuilder<DocumentSnapshot<Object?>>(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .get(),
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text('Loading..');
                          }
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Text(
                            "${data['FullName']}",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: queryData.size.width * 0.55,
                    padding: EdgeInsets.only(
                      top: queryData.size.height * 0.02,
                      bottom: queryData.size.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff99999d),
                          width: 1.0, // Underline thickness
                        ),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: 0.50,
                        child: Text(
                          email,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: queryData.size.height * 0.011,
                      bottom: queryData.size.height * 0.01,
                      left: queryData.size.width * 0.08,
                      right: queryData.size.width * 0.08,
                    ),
                    // decoration: BoxDecoration(
                    //   border: Border(
                    //     bottom: BorderSide(
                    //       color: Colors.black,
                    //       width: 1.0, // Underline thickness
                    //     ),
                    //   ),
                    // ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: 0.50,
                        child: Text(
                          "Shared 5 recipes",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: queryData.size.height * 0.02),

            Container(
              height: queryData.size.height * 0.43,
              child: ProfileList(email),
            ),
          ],
        ),
      ),
    );
  }
}
