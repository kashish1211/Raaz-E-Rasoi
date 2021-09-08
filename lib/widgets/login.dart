import 'package:flutter/material.dart';

import './header.dart';

class Login extends StatelessWidget {
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
            Header(true),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              padding: EdgeInsets.only(
                bottom: queryData.viewInsets.bottom + 10,
              ),
              child: Column(
                children: [
                  SizedBox(height: queryData.size.height * 0.04),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffa4a0c)),
                      ),
                    ),
                    onSubmitted: (_) => {},
                  ),
                  SizedBox(height: queryData.size.height * 0.04),
                  TextField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffa4a0c)),
                      ),
                    ),
                    onSubmitted: (_) => {},
                  ),
                  SizedBox(height: queryData.size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xffff460a),
                          ),
                        ),
                        onPressed: () => {},
                      ),
                    ],
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
                      "Login",
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