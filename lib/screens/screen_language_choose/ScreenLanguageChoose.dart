import 'package:flutter/material.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_home/screen_home.dart';
import 'package:uzmobile/widgets/rounded_button.dart';

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
            height: 20,
          ),
          RoundedButton(
            text: AllStrings.tillar[0],
            press: () {
              SharedPrefHelper.changeLanguage(0);
              Navigator.pushNamed(
                context,
                ScreenHome.routeName,
              );
            },
            verticalPadding: 19,
            horizontalMargin: 25,
          ),
          RoundedButton(
            text: AllStrings.tillar[1],
            press: () {
              SharedPrefHelper.changeLanguage(1);
              Navigator.pushNamed(
                context,
                ScreenHome.routeName,
              );
            },
            verticalPadding: 19,
            horizontalMargin: 25,
          ),
          RoundedButton(
            text: AllStrings.tillar[2],
            press: () {
              SharedPrefHelper.changeLanguage(2);
              Navigator.pushNamed(
                context,
                ScreenHome.routeName,
              );
            },
            verticalPadding: 19,
            horizontalMargin: 25,
          ),
        ],
      ),
    );
  }
}
