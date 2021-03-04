import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/firebase_helper.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_all_page/screen_all_page.dart';
import 'package:uzmobile/screens/screen_home/carousel.dart';
import 'package:uzmobile/screens/screen_home/widget_card.dart';
import 'package:uzmobile/screens/screen_home/widget_card_item_2.dart';

class Body extends StatefulWidget {
  final int chosenLanguage;
  final Function() notifyParent;

  const Body({
    Key key,
    @required this.chosenLanguage,
    @required this.notifyParent,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // SizedBox(height: 2.5 * SizeConfig.safeBlockVertical),
          // Image.asset(
          //   'assets/images/logo.png',
          //   fit: BoxFit.cover,
          //   width: SizeConfig.screenWidth * 0.5,
          // ),
          SizedBox(height: 1.5 * SizeConfig.safeBlockVertical),
          Padding(
            padding: EdgeInsets.only(
              left: 3 * SizeConfig.safeBlockHorizontal,
              right: 3 * SizeConfig.safeBlockHorizontal,
            ),
            child: Carousel(),
          ),
          // SizedBox(height: 2.5 * SizeConfig.safeBlockVertical),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 3 * SizeConfig.safeBlockHorizontal,
                right: 3 * SizeConfig.safeBlockHorizontal,
              ),
              child: Text(
                AllStrings.kategoriya[widget.chosenLanguage],
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                  color: kBottomBarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // SizedBox(height: 1 * SizeConfig.safeBlockVertical),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                WidgetCardItem2(
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
                WidgetCardItem2(
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
                WidgetCardItem2(
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
                WidgetCardItem2(
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
                WidgetCardItem2(
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
                WidgetCardItem2(
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
          SizedBox(height: SizeConfig.safeBlockVertical * 1),
          WidgetCard(
            chosenLanguage: widget.chosenLanguage,
            notifyParent: () {
              widget.notifyParent();
            },
          ),
        ],
      ),
    );
  }
}
