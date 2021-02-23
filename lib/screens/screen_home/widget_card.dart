import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/firebase_helper.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_all_page/screen_all_page.dart';

import 'widget_card_item.dart';

class WidgetCard extends StatefulWidget {
  final int chosenLanguage;
  final Function() notifyParent;

  const WidgetCard({
    Key key,
    @required this.chosenLanguage,
    @required this.notifyParent,
  }) : super(key: key);

  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  int _index = 0;

  // int chosenLanguage;

  @override
  Widget build(BuildContext context) {
    // chosenLanguage = SharedPrefHelper.chosenLanguage;
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
                title: AllStrings.uSSD[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.ussd,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.credit_card_fea,
                title: AllStrings.tariflar[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.tariff,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.library_add_mdi,
                title: AllStrings.xizmatlar[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.service,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
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
                title: AllStrings.daqiqa[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.daqiqa,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.ios_globe_ion,
                title: AllStrings.internet[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.internet,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sms_mdi,
                title: AllStrings.sms[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.sms,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
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
                title: AllStrings.kategoriya1[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.k1,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya2[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.k2,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya3[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.k3,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
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
                title: AllStrings.kategoriya4[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.k4,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya5[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.k5,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
              WidgetCardItem(
                iconData: FlutterIcons.sim_card_faw5s,
                title: AllStrings.kategoriya6[widget.chosenLanguage],
                onPress: () async {
                  await Navigator.pushNamed(
                    context,
                    AllPageScreen.routeName,
                    arguments: AllPageScreenArguments(
                      firebaseTable: FirebaseTables.k6,
                    ),
                  );
                  setState(() {
                    widget.notifyParent();
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
