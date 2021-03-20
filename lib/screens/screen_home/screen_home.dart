import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/widgets/drawer_2.dart';

import 'body.dart';

class ScreenHome extends StatefulWidget {
  static String routeName = '/ScreenHome';

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int chosenLanguage;

  @override
  Widget build(BuildContext context) {
    chosenLanguage = SharedPrefHelper.chosenLanguage;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kScaffoldBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: CustomDrawer2(),
      ),
      body: Body(),
    );
  }
}
