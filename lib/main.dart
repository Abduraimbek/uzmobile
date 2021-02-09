import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/routes.dart';
import 'package:uzmobile/constants/theme.dart';
import 'package:uzmobile/screens/screen_home/screen_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: kMainBlueColor, // navigation bar color
      // statusBarColor: Colors.pink, // status bar color
    ));
    return MaterialApp(
      title: 'uzmobile',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: ScreenHome.routeName,
    );
  }
}
