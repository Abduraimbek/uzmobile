import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/firebase_arguments.dart';
import 'package:uzmobile/screens/screen_home/screen_home.dart';
import 'package:uzmobile/screens/screen_language_choose/ScreenLanguageChoose.dart';

class ScreenFirstScreen extends StatefulWidget {
  static const String routeName = "/ScreenFirstScreen";

  @override
  _ScreenFirstScreenState createState() => _ScreenFirstScreenState();
}

class _ScreenFirstScreenState extends State<ScreenFirstScreen>
    with AfterLayoutMixin<ScreenFirstScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => ScreenHome(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => ScreenLanguageChoose(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    FirebaseInitialize().initializeFirebase();
    SharedPrefHelper.getLanguage();
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    checkFirstSeen();
  }
}
