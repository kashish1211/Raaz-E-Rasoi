import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/authenticate/login.dart';
import 'package:raaz_e_rasoi/widgets/authenticate/signup.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var _login = true;

  void _getSignUp() {
    setState(() {});
    _login = false;
  }

  void _getLogin() {
    setState(() {});
    _login = true;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Stack(
      children: [
        GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              _getLogin();
            }
            // Swiping in left direction.
            if (details.delta.dx < 0) {
              _getSignUp();
            }
          },
          child: Container(
            child: (_login) ? Login() : Signup(),
          ),
        ),
        Container(
          width: double.infinity,
          height: queryData.size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x0f000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: queryData.size.height * 0.05),
                  constraints: const BoxConstraints(
                    minWidth: 250,
                    minHeight: 200,
                    maxWidth: 450,
                    maxHeight: 400,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: _getLogin,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: _getSignUp,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: (_login)
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Container(
                        width: queryData.size.width * 0.4,
                        height: 4,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19c33f15),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: Color(0xfffa4a0c),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
