import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/routes.dart';
import 'package:uzmobile/screens/screen_first_screen/screen_first_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarColor: kPrimaryDark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'uzmobile',
      theme: ThemeData(
        fontFamily: 'ABeeZee',
        primaryColor: kPrimary,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: ScreenFirstScreen.routeName,
    );
  }
}
