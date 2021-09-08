import 'package:flutter/material.dart';

import './header.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
        ),
        child: ListView(
          children: [
            Header(false),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              padding: EdgeInsets.only(
                bottom: queryData.viewInsets.bottom + 10,
              ),
              child: Column(
                children: [
                  SizedBox(height: queryData.size.height * 0.03),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffa4a0c)),
                      ),
                    ),
                    onSubmitted: (_) => {},
                  ),
                  SizedBox(height: queryData.size.height * 0.03),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffa4a0c)),
                      ),
                    ),
                    onSubmitted: (_) => {},
                  ),
                  SizedBox(height: queryData.size.height * 0.03),
                  TextField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffa4a0c)),
                      ),
                    ),
                    onSubmitted: (_) => {},
                  ),
                  SizedBox(height: queryData.size.height * 0.08),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffff460a),
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () => {},
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
