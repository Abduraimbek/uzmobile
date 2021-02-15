import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_all_page/screen_all_page.dart';

import 'widget_card_item.dart';

class WidgetCard extends StatefulWidget {
  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3 * SizeConfig.safeBlockHorizontal,
        right: 3 * SizeConfig.safeBlockHorizontal,
        bottom: 5 * SizeConfig.safeBlockVertical,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  3 * SizeConfig.safeBlockHorizontal,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 2 * SizeConfig.safeBlockHorizontal,
                  ),
                ],
              ),
              child: PageView(
                onPageChanged: (number) {
                  setState(() {
                    _index = number;
                  });
                },
                children: [
                  buildColumn1(),
                  buildColumn2(),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 2.0 * SizeConfig.safeBlockHorizontal,
                height: 2.0 * SizeConfig.safeBlockVertical,
                margin: EdgeInsets.symmetric(
                  vertical: 1 * SizeConfig.safeBlockVertical,
                  horizontal: .8 * SizeConfig.safeBlockHorizontal,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _index == 0 ? kBottomBarColor : kCardIconBackColor,
                ),
              ),
              Container(
                width: 2.0 * SizeConfig.safeBlockHorizontal,
                height: 2.0 * SizeConfig.safeBlockVertical,
                margin: EdgeInsets.symmetric(
                  vertical: 1 * SizeConfig.safeBlockVertical,
                  horizontal: .8 * SizeConfig.safeBlockHorizontal,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _index == 1 ? kBottomBarColor : kCardIconBackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildColumn1() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              WidgetCardItem(
                iconData: FlutterIcons.hash_fea,
                title: AllStrings.uSSD[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.uSSD[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.credit_card_fea,
                title: AllStrings.tariflar[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.tariflar[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.library_add_mdi,
                title: AllStrings.xizmatlar[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.xizmatlar[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WidgetCardItem(
                iconData: FlutterIcons.phone_fea,
                title: AllStrings.daqiqa[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.daqiqa[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.ios_globe_ion,
                title: AllStrings.internet[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.internet[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sms_mdi,
                title: AllStrings.sms[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.sms[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildColumn2() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya1[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.kategoriya1[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya2[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.kategoriya2[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya3[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.kategoriya3[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya4[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.kategoriya4[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya5[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.kategoriya5[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya6[SharedPrefHelper.chosenLanguage],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      AllStrings.kategoriya6[SharedPrefHelper.chosenLanguage],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
