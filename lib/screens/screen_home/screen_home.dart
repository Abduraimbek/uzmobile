import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/widgets/bottom_bar.dart';

class ScreenHome extends StatefulWidget {
  static String routeName = '/ScreenHome';

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainBlueColor,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Uzmobile'),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Icon(FlutterIcons.telegram_mco),
            ),
            SizedBox(width: 5),
          ],
        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFFF17532),
          child: Icon(FlutterIcons.md_home_ion),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
