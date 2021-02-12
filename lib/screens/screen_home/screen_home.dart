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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 7.5 * SizeConfig.safeBlockVertical,
        title: Text(''),
        elevation: 4,
        leading: IconButton(
          icon: Icon(
            FlutterIcons.menu_mco,
            size: 8 * SizeConfig.safeBlockHorizontal,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () {
              launch(
                "https://telegram.me/abduraimbek",
              );
            },
            child: Icon(
              FlutterIcons.telegram_mco,
              size: 9 * SizeConfig.safeBlockHorizontal,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 4 * SizeConfig.safeBlockHorizontal),
          InkWell(
            onTap: () {
              // todo
            },
            child: Icon(
              FlutterIcons.bell_mco,
              size: 8 * SizeConfig.safeBlockHorizontal,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 3.5 * SizeConfig.safeBlockHorizontal),
        ],
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kOrange,
        child: Icon(
          FlutterIcons.home_ant,
          size: 9 * SizeConfig.safeBlockHorizontal,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
      body: Body(),
    );
  }
}
