import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/datas/ussd.dart';

class BodyUSSD2 extends StatefulWidget {
  @override
  _BodyUSSD2State createState() => _BodyUSSD2State();
}

class _BodyUSSD2State extends State<BodyUSSD2> {
  USSD _ussd;

  @override
  void initState() {
    super.initState();
    _ussd = USSD()..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackground(),
        buildBody(context),
      ],
    );
  }

  Container buildBackground() {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: SizeConfig.screenHeight,
              color: kPrimaryWithOpacity,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              height: SizeConfig.screenHeight,
              color: kScaffoldBg,
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildBody(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.safeBlockVertical * 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * .035,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: SizeConfig.screenWidth * .07,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: SizeConfig.screenWidth * 0.08,
                    ),
                    child: Text(
                      AllStrings.uSSD[SharedPrefHelper.chosenLanguage],
                      style: TextStyle(
                        color: kDarkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenWidth * 0.05,
                        letterSpacing: SizeConfig.screenWidth * 0.012,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 92,
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
          ],
        ),
      ),
    );
  }

  Widget ussdItem({
    context,
    String text,
    String code,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeConfig.screenHeight * .02,
        top: SizeConfig.screenHeight * .02,
      ),
      child: Container(
        height: SizeConfig.screenHeight * .15,
        child: Stack(
          children: [
            Positioned(
              right: SizeConfig.screenWidth * .1,
              child: Container(
                height: SizeConfig.screenHeight * .15,
                width: SizeConfig.screenWidth * .75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * .06,
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
              ),
            ),
            Positioned(
              top: SizeConfig.screenHeight * .075 - SizeConfig.screenWidth * .1,
              right: SizeConfig.screenWidth * .75,
              child: Container(
                width: SizeConfig.screenWidth * .2,
                height: SizeConfig.screenWidth * .2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.screenWidth * 0.02),
                  child: Image.asset('assets/images/icon.png'),
                ),
              ),
            ),
            Positioned(
              right: SizeConfig.screenWidth * .03,
              top: SizeConfig.screenHeight * .075 -
                  SizeConfig.screenWidth * 0.07,
              child: InkWell(
                onTap: () => launchUrl(
                  context: context,
                  ussdCode: code,
                  dialogTitle: code,
                  text: text,
                ),
                child: Container(
                  width: SizeConfig.screenWidth * .14,
                  height: SizeConfig.screenWidth * .14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
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
                      Icons.arrow_forward_ios,
                      color: kPrimaryWithOpacityBottom,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: SizeConfig.screenWidth * .2,
              child: Container(
                width: SizeConfig.screenWidth * .5,
                height: SizeConfig.screenHeight * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      code,
                      style: TextStyle(
                        color: kDarkBlue,
                        fontSize: SizeConfig.screenWidth * .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      text,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
