import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/firebase_helper.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_all_page/body_daqiqa.dart';
import 'package:uzmobile/screens/screen_all_page/body_internet.dart';
import 'package:uzmobile/screens/screen_all_page/body_xizmat.dart';
import 'package:uzmobile/screens/settings_language/settings_language_screen.dart';
import 'package:uzmobile/widgets/bottom_bar.dart';

import 'body_ussd.dart';

class AllPageScreen extends StatefulWidget {
  static String routeName = '/AllPageScreen';

  @override
  _AllPageScreenState createState() => _AllPageScreenState();
}

class _AllPageScreenState extends State<AllPageScreen> {
  @override
  Widget build(BuildContext context) {
    final AllPageScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: kMainBlueColor,
      appBar: AppBar(
        title: Text(
          findOutAppbarTitle(arguments.firebaseTable),
        ),
        backgroundColor: kMainBlueColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: kOrange,
        child: Icon(
          FlutterIcons.home_ant,
          size: 9 * SizeConfig.safeBlockHorizontal,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: BottomBar(
          onPressSettings: () async {
            await Navigator.pushNamed(
              context,
              SettingsLanguageScreen.routeName,
            );
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: chosenBody(arguments.firebaseTable),
      ),
    );
  }

  Widget chosenBody(FirebaseTables firebaseTable) {
    switch (firebaseTable) {
      case FirebaseTables.ussd:
        return BodyUSSD();
        break;
      case FirebaseTables.service:
        return BodyXizmat();
        break;
      case FirebaseTables.daqiqa:
        return BodyDaqiqa();
        break;
      case FirebaseTables.internet:
        return BodyInternet();
        break;
      default:
        return Container(
          child: Center(
            child: Text('Hello Boy!'),
          ),
        );
        break;
    }
  }

  String findOutAppbarTitle(FirebaseTables firebaseTable) {
    int t = SharedPrefHelper.chosenLanguage;
    switch (firebaseTable) {
      case FirebaseTables.ussd:
        return AllStrings.uSSD[t];
        break;
      case FirebaseTables.tariff:
        return AllStrings.tariflar[t];
        break;
      case FirebaseTables.service:
        return AllStrings.xizmatlar[t];
        break;
      case FirebaseTables.daqiqa:
        return AllStrings.daqiqa[t];
        break;
      case FirebaseTables.internet:
        return AllStrings.internet[t];
        break;
      case FirebaseTables.sms:
        return AllStrings.sms[t];
        break;
      default:
        return AllStrings.kategoriya1[t];
        break;
    }
  }
}

class AllPageScreenArguments {
  final FirebaseTables firebaseTable;

  AllPageScreenArguments({
    @required this.firebaseTable,
  });
}
