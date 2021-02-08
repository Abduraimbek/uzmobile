import 'package:flutter/material.dart';
import 'package:uzmobile/constants/routes.dart';
import 'package:uzmobile/screens/screen_home/screen_home.dart';
import 'package:uzmobile/screens/screen_language_choose/ScreenLanguageChoose.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uzmobile',
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: ScreenHome.routeName,
    );
  }
}
