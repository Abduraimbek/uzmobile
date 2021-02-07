import 'package:flutter/material.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/rounded_button.dart';

class ScreenLanguageChoose extends StatelessWidget {
  static String routeName = '/ScreenLanguageChoose';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Image.asset(
                'assets/images/uzmobile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          RoundedButton(
            text: AllStrings.tillar[0],
            verticalPadding: 20,
            press: () {},
          ),
          RoundedButton(
            text: AllStrings.tillar[1],
            verticalPadding: 20,
            press: () {},
          ),
          RoundedButton(
            text: AllStrings.tillar[2],
            verticalPadding: 20,
            press: () {},
          ),
        ],
      ),
    );
  }
}
