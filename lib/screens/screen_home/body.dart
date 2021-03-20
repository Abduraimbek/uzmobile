import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/firebase_helper.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_all_page/screen_all_page.dart';
import 'package:uzmobile/screens/screen_home/build_home_page_icons_bottom.dart';
import 'package:uzmobile/screens/screen_home/build_home_page_icons_top.dart';
import 'package:uzmobile/screens/screen_home/card_item.dart';
import 'package:uzmobile/screens/screen_home/top_bar.dart';

import 'bottom_bar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget _arrowButton;
  Widget _column;
  Widget _text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackground(),
        Positioned(
          left: 0,
          right: 0,
          top: SizeConfig.screenHeight * .25,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _text ?? buildText(),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              child: child,
              scale: animation,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: SizeConfig.screenHeight * 0.34,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _column ?? buildPositionedColumn(context),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              child: child,
              scale: animation,
            ),
          ),
        ),
        Positioned(
          right: SizeConfig.screenWidth * .07,
          top: SizeConfig.screenHeight * .5,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _arrowButton ?? buildArrowButton(context),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              child: child,
              scale: animation,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: SizeConfig.screenHeight * 0.83,
          child: BuildHomePageIconsBottom(),
        ),
        Positioned(
          right: 0,
          top: SizeConfig.screenHeight * .13,
          child: BuildHomePageIconsTop(),
        ),
      ],
    );
  }

  Widget buildText() {
    return Container(
      key: ValueKey<int>(0),
      child: Text(
        'Uzmobile USSD',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kDarkBlue,
          fontSize: SizeConfig.screenWidth * .06,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildText2() {
    return Container(
      key: ValueKey<int>(1),
      child: Text(
        AllStrings.kategoriya[SharedPrefHelper.chosenLanguage],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kDarkBlue,
          fontSize: SizeConfig.screenWidth * .06,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildArrowButton(context) {
    return InkWell(
      key: ValueKey<int>(2),
      onTap: () {
        setState(() {
          _arrowButton = buildArrowButton2(context);
          _text = buildText2();
          _column = buildPositionedColumn2(context);
        });
      },
      child: Container(
        width: SizeConfig.screenWidth * .16,
        height: SizeConfig.screenWidth * .16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryWithOpacity,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Icon(
            FlutterIcons.sim_card_faw5s,
            color: Colors.white,
            size: SizeConfig.screenWidth * .075,
          ),
        ),
      ),
    );
  }

  Widget buildArrowButton2(context) {
    return InkWell(
      key: ValueKey<int>(3),
      onTap: () {
        setState(() {
          _arrowButton = buildArrowButton(context);
          _text = buildText();
          _column = buildPositionedColumn(context);
        });
      },
      child: Container(
        width: SizeConfig.screenWidth * .16,
        height: SizeConfig.screenWidth * .16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryWithOpacity,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Icon(
            FlutterIcons.hash_fea,
            color: Colors.white,
            size: SizeConfig.screenWidth * .075,
          ),
        ),
      ),
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
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.screenHeight * .008),
          CardItem(
            iconData: FlutterIcons.hash_fea,
            text: AllStrings.uSSD[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.ussd,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .17,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.credit_card_fea,
            text: AllStrings.tariflar[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.tariff,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .075,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.library_add_mdi,
            text: AllStrings.xizmatlar[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.service,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .075,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.phone_fea,
            text: AllStrings.daqiqa[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.daqiqa,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .075,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.ios_globe_ion,
            text: AllStrings.internet[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.internet,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .17,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.sms_mdi,
            text: AllStrings.sms[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.sms,
                ),
              );
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * .008),
        ],
      ),
    );
  }

  Widget buildPositionedColumn2(BuildContext context) {
    return Container(
      key: ValueKey<int>(5),
      width: SizeConfig.screenWidth * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(SizeConfig.screenWidth * .3),
          bottomRight: Radius.circular(SizeConfig.screenWidth * .3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.screenHeight * .008),
          CardItem(
            iconData: FlutterIcons.sim_card_faw5s,
            text: AllStrings.kategoriya1[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.k1,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .17,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.sim_card_faw5s,
            text: AllStrings.kategoriya2[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.k2,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .075,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.sim_card_faw5s,
            text: AllStrings.kategoriya3[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.k3,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .075,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.sim_card_faw5s,
            text: AllStrings.kategoriya4[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.k4,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .075,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.sim_card_faw5s,
            text: AllStrings.kategoriya5[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.k5,
                ),
              );
            },
          ),
          Divider(
            thickness: SizeConfig.screenHeight * .001,
            endIndent: SizeConfig.screenWidth * .17,
            color: Colors.grey.withOpacity(0.5),
          ),
          CardItem(
            iconData: FlutterIcons.sim_card_faw5s,
            text: AllStrings.kategoriya6[SharedPrefHelper.chosenLanguage],
            onPress: () {
              Navigator.pushNamed(
                context,
                AllPageScreen.routeName,
                arguments: AllPageScreenArguments(
                  firebaseTable: FirebaseTables.k6,
                ),
              );
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * .008),
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
}
