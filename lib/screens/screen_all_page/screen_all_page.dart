import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/firebase_helper.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_all_page/body_daqiqa_2.dart';
import 'package:uzmobile/screens/screen_all_page/body_internet_2.dart';
import 'package:uzmobile/screens/screen_all_page/body_number_2.dart';
import 'package:uzmobile/screens/screen_all_page/body_sms_2.dart';
import 'package:uzmobile/screens/screen_all_page/body_tariff_2.dart';
import 'package:uzmobile/screens/screen_all_page/body_ussd_2.dart';
import 'package:uzmobile/screens/screen_all_page/body_xizmat_2.dart';

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
      backgroundColor: kScaffoldBg,
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: chosenBody(arguments.firebaseTable),
      ),
    );
  }

  Widget chosenBody(FirebaseTables firebaseTable) {
    switch (firebaseTable) {
      case FirebaseTables.ussd:
        return BodyUSSD2();
        break;
      case FirebaseTables.service:
        return BodyXizmat2();
        break;
      case FirebaseTables.daqiqa:
        return BodyDaqiqa2();
        break;
      case FirebaseTables.internet:
        return BodyInternet2();
        break;
      case FirebaseTables.tariff:
        return BodyTariff2();
        break;
      case FirebaseTables.sms:
        return BodySMS2();
        break;
      case FirebaseTables.k1:
        return BodyNumber2(
          numberCategory: 1,
          appBarTitle: findOutAppbarTitle(firebaseTable),
        );
        break;
      case FirebaseTables.k2:
        return BodyNumber2(
          numberCategory: 2,
          appBarTitle: findOutAppbarTitle(firebaseTable),
        );
        break;
      case FirebaseTables.k3:
        return BodyNumber2(
          numberCategory: 3,
          appBarTitle: findOutAppbarTitle(firebaseTable),
        );
        break;
      case FirebaseTables.k4:
        return BodyNumber2(
          numberCategory: 4,
          appBarTitle: findOutAppbarTitle(firebaseTable),
        );
        break;
      case FirebaseTables.k5:
        return BodyNumber2(
          numberCategory: 5,
          appBarTitle: findOutAppbarTitle(firebaseTable),
        );
        break;
      default:
        return BodyNumber2(
          numberCategory: 6,
          appBarTitle: findOutAppbarTitle(firebaseTable),
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
      case FirebaseTables.k1:
        return AllStrings.kategoriya1[t];
        break;
      case FirebaseTables.k2:
        return AllStrings.kategoriya2[t];
        break;
      case FirebaseTables.k3:
        return AllStrings.kategoriya3[t];
        break;
      case FirebaseTables.k4:
        return AllStrings.kategoriya4[t];
        break;
      case FirebaseTables.k5:
        return AllStrings.kategoriya5[t];
        break;
      default:
        return AllStrings.kategoriya6[t];
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
