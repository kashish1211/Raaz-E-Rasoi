import 'package:flutter/material.dart';
import 'package:raaz_e_rasoi/widgets/header.dart';
import 'package:raaz_e_rasoi/widgets/login.dart';
import 'package:raaz_e_rasoi/widgets/signup.dart';

class Landing extends StatelessWidget {
  void getLoginSignup(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Header();
    }));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffff4b3a),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: queryData.size.height * 0.3,
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
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 250,
                    minHeight: 200,
                    maxWidth: 400,
                    maxHeight: 350,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: queryData.size.height * 0.03),
            Container(
              width: double.infinity,
              height: queryData.size.height * 0.53,
              child: Image.asset(
                'assets/images/india.png',
              ),
            ),
            SizedBox(height: queryData.size.height * 0.02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () => getLoginSignup(context),
              child: Text(
                "Bon Appétit",
                style: TextStyle(
                  color: Color(0xffff460a),
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
