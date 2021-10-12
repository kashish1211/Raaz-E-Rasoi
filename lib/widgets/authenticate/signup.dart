import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../home.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userFullname = '';
  String _userPassword = '';

  void getMyHome(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return MyHome();
    }));
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      signup();
    }
  }

  void signup() async {
    try {
      UserCredential authResult;
      authResult = await _auth.createUserWithEmailAndPassword(
          email: _userEmail, password: _userPassword);
    } on PlatformException catch (e) {
      // var message = "An error has occured."

    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Material(
      child: Container(
        margin: EdgeInsets.only(top: queryData.size.height * 0.4),
        height: queryData.size.height * 0.6,
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              padding: EdgeInsets.only(
                bottom: queryData.viewInsets.bottom + 10,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: queryData.size.height * 0.03),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your good name';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xfffa4a0c)),
                        ),
                      ),
                      onSaved: (value) {
                        _userFullname = value!;
                      },

                      // onSubmitted: (_) => {},
                    ),
                    SizedBox(height: queryData.size.height * 0.03),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Enter valid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email address',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xfffa4a0c)),
                        ),
                      ),
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                      // onSubmitted: (_) => {},
                    ),
                    SizedBox(height: queryData.size.height * 0.03),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return 'Too Short!';
                        }
                        return null;
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xfffa4a0c)),
                        ),
                      ),
                      onSaved: (value) {
                        _userPassword = value!;
                      },
                      // onSubmitted: (_) => {},
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
                      onPressed: _trySubmit,
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
            ),
          ],
        ),
      ),
    );
  }
}
