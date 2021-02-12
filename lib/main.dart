import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzmobile/constants/routes.dart';
import 'package:uzmobile/screens/screen_first_screen/screen_first_screen.dart';

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
      systemNavigationBarColor: Colors.black, // navigation bar color
      // systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      // statusBarColor: Colors.pink, // status bar color
    ));
    return MaterialApp(
      title: 'uzmobile',
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: ScreenFirstScreen.routeName,
    );
  }
}
