import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raaz_e_rasoi/widgets/home.dart';

import 'header.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  void getMyHome(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return MyHome();
    }));
  }

  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      login();
    }
  }

  void login() async {
    UserCredential authResult;
    authResult = await _auth.signInWithEmailAndPassword(
        email: _userEmail, password: _userPassword);
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
            // Header(),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              padding: EdgeInsets.only(
                bottom: queryData.viewInsets.bottom + 10,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: queryData.size.height * 0.04),
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
                          fontSize: 18,
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
                    SizedBox(height: queryData.size.height * 0.04),
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
                          fontSize: 18,
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
                      onPressed: _trySubmit,
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
            ),
          ],
        ),
      ),
    );
  }
}
