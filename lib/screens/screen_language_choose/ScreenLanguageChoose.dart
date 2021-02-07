import 'package:flutter/material.dart';

class ScreenLanguageChoose extends StatelessWidget {
  static String routeName = '/ScreenLanguageChoose';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Image.asset(
              'assets/images/uzmobile.png',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
