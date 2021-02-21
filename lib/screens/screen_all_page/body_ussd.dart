import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/datas/ussd.dart';

class BodyUSSD extends StatefulWidget {
  @override
  _BodyUSSDState createState() => _BodyUSSDState();
}

class _BodyUSSDState extends State<BodyUSSD> {
  USSD _ussd;

  @override
  void initState() {
    super.initState();
    _ussd = USSD()..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6 * SizeConfig.safeBlockHorizontal),
                topRight: Radius.circular(6 * SizeConfig.safeBlockHorizontal),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 3 * SizeConfig.safeBlockVertical,
                bottom: 5 * SizeConfig.safeBlockVertical,
              ),
              child: FirebaseAnimatedList(
                shrinkWrap: true,
                query: _ussd.ussdRef,
                itemBuilder: (
                  BuildContext context,
                  DataSnapshot snapshot,
                  Animation<double> animation,
                  int index,
                ) {
                  _ussd.snapshot(snapshot);
                  return ussdItem(
                    context: context,
                    code: _ussd.code,
                    text: _ussd.text,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget ussdItem({
    String code,
    String text,
    context,
  }) {
    return InkWell(
      onTap: () => launchUrl(
        context: context,
        ussdCode: code,
        dialogTitle: code,
        text: text,
      ),
      child: ussdCard(
        code,
        text,
      ),
    );
  }

  Widget ussdCard(
    String code,
    String text,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 1.25 * SizeConfig.safeBlockVertical,
        top: 1.25 * SizeConfig.safeBlockVertical,
        left: 2.5 * SizeConfig.safeBlockHorizontal,
        right: 2.5 * SizeConfig.safeBlockHorizontal,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 10 * SizeConfig.safeBlockVertical,
              decoration: boxDecoration,
              child: Center(
                child: Text(
                  code,
                  style: TextStyle(
                    color: kBottomBarColor,
                    fontStyle: FontStyle.italic,
                    fontSize: 3.4 * SizeConfig.safeBlockHorizontal,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3 * SizeConfig.safeBlockHorizontal),
          Expanded(
            flex: 7,
            child: Container(
              height: 10 * SizeConfig.safeBlockVertical,
              decoration: boxDecoration,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 2 * SizeConfig.safeBlockHorizontal,
                    right: 2 * SizeConfig.safeBlockHorizontal,
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: kBottomBarColor,
                      fontSize: 3.2 * SizeConfig.safeBlockHorizontal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
