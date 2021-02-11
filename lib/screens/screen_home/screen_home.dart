import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/widgets/bottom_bar.dart';

import 'body.dart';

class ScreenHome extends StatefulWidget {
  static String routeName = '/ScreenHome';

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SharedPrefHelper.getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kMainBlueColor,
        leading: IconButton(
          icon: Icon(
            FlutterIcons.menu_mco,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: false,
        title: Text(
          "UZMOBILE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              launch(
                "https://telegram.me/abduraimbek",
              );
            },
            child: Icon(
              FlutterIcons.telegram_mco,
              size: 30,
            ),
          ),
          SizedBox(width: 15),
          InkWell(
            onTap: () {
              // todo
            },
            child: Icon(
              FlutterIcons.bell_mco,
              size: 30,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFF17532),
        child: Icon(
          FlutterIcons.md_home_ion,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
      body: Body(),
    );
  }
}
