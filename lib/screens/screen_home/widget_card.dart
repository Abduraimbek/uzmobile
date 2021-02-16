import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
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
                      appBarTitle: AllStrings.uSSD,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.tariflar,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.xizmatlar,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.daqiqa,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.internet,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.sms,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.kategoriya1,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.kategoriya2,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.kategoriya3,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.kategoriya4,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.kategoriya5,
                      chosenLanguage: widget.chosenLanguage,
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
                      appBarTitle: AllStrings.kategoriya6,
                      chosenLanguage: widget.chosenLanguage,
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
