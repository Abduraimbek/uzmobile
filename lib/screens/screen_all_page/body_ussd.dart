import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        dialogTitle: text,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 4 * SizeConfig.safeBlockHorizontal,
          right: 4 * SizeConfig.safeBlockHorizontal,
          bottom: 1.5 * SizeConfig.safeBlockVertical,
          top: 1.5 * SizeConfig.safeBlockVertical,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: kMainBlueColorWithOpacity,
            borderRadius: BorderRadius.circular(
              4 * SizeConfig.safeBlockHorizontal,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Text(
                      code,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 4 * SizeConfig.safeBlockHorizontal,
                      ),
                    ),
                  ),
                  height: 10 * SizeConfig.safeBlockVertical,
                  decoration: BoxDecoration(
                    color: kMainBlueColor,
                    borderRadius: BorderRadius.circular(
                      4 * SizeConfig.safeBlockHorizontal,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 3 * SizeConfig.safeBlockHorizontal,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
