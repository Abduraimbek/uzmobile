import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_home/bottom_bar.dart';
import 'package:uzmobile/screens/screen_home/screen_home.dart';
import 'package:uzmobile/screens/screen_home/top_bar.dart';
import 'package:uzmobile/screens/screen_language_choose/item.dart';

class ScreenLanguageChoose extends StatelessWidget {
  static String routeName = '/ScreenLanguageChoose';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kScaffoldBg,
      body: Stack(
        children: [
          buildBackground(),
          Positioned(
            left: 0,
            top: SizeConfig.screenHeight * 0.43,
            child: buildPositionedColumn(context),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: SizeConfig.screenHeight * 0.2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * .14,
              ),
              child: Image.asset(
                'assets/images/uzmobile.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildBackground() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: TopBar(),
        ),
        Container(
          child: BottomBar(),
        ),
      ],
    );
  }

  Widget buildPositionedColumn(BuildContext context) {
    return Container(
      key: ValueKey<int>(4),
      width: SizeConfig.screenWidth * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(SizeConfig.screenWidth * .3),
          bottomRight: Radius.circular(SizeConfig.screenWidth * .3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.1, 0.1), //(x,y)
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.screenHeight * .008),
          Item(
            text: AllStrings.tillar[0],
            onPress: () {
              onTap(context, 0);
            },
          ),
          Divider(
            thickness: 1,
            endIndent: SizeConfig.screenWidth * .075,
            color: Colors.grey.withOpacity(0.5),
          ),
          Item(
            text: AllStrings.tillar[1],
            onPress: () {
              onTap(context, 1);
            },
          ),
          Divider(
            thickness: 1,
            endIndent: SizeConfig.screenWidth * .075,
            color: Colors.grey.withOpacity(0.5),
          ),
          Item(
            text: AllStrings.tillar[2],
            onPress: () {
              onTap(context, 2);
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * .008),
        ],
      ),
    );
  }

  onTap(context, int languageInt) async {
    SharedPrefHelper.changeLanguage(languageInt);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
    Navigator.popAndPushNamed(
      context,
      ScreenHome.routeName,
    );
  }
}
