import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/datas/daqiqa.dart';

class BodyDaqiqa2 extends StatefulWidget {
  @override
  _BodyDaqiqa2State createState() => _BodyDaqiqa2State();
}

class _BodyDaqiqa2State extends State<BodyDaqiqa2> {
  Daqiqa _daqiqa;

  @override
  void initState() {
    super.initState();
    _daqiqa = Daqiqa()..initialize();
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
            flex: 7,
            child: Container(
              height: SizeConfig.screenHeight,
              color: kScaffoldBg,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: SizeConfig.screenHeight,
              color: kPrimaryWithOpacity,
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
                        color: kDarkBlue,
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
                      AllStrings.daqiqa[SharedPrefHelper.chosenLanguage],
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
                query: _daqiqa.reference,
                itemBuilder: (
                  BuildContext context,
                  DataSnapshot snapshot,
                  Animation<double> animation,
                  int index,
                ) {
                  _daqiqa.snapshot(snapshot);
                  return daqiqaItem(
                    context: context,
                    code: _daqiqa.code,
                    money: _daqiqa.money,
                    time: _daqiqa.time,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget daqiqaItem({
    context,
    String code,
    int time,
    String money,
  }) {
    return InkWell(
      onTap: () => launchUrl(
        context: context,
        ussdCode: code,
        dialogTitle:
            "$time ${AllStrings.daqiqa[SharedPrefHelper.chosenLanguage]}",
        text:
            "$money\n${AllStrings.berilganDaqiqaHajmi[SharedPrefHelper.chosenLanguage]}$time\n${AllStrings.amal30[SharedPrefHelper.chosenLanguage]}",
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 2.5 * SizeConfig.safeBlockHorizontal,
          right: 2.5 * SizeConfig.safeBlockHorizontal,
          bottom: 1.5 * SizeConfig.safeBlockVertical,
          top: 1.5 * SizeConfig.safeBlockVertical,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Center(
                  child: Text(
                    time.toString(),
                    style: TextStyle(
                      color: kPrimaryWithOpacityBottom,
                      fontWeight: FontWeight.bold,
                      fontSize: 4 * SizeConfig.safeBlockHorizontal,
                    ),
                  ),
                ),
                height: 16 * SizeConfig.safeBlockVertical,
                decoration: boxDecoration,
              ),
            ),
            SizedBox(width: 3.5 * SizeConfig.safeBlockHorizontal),
            Expanded(
              flex: 7,
              child: Container(
                height: 16 * SizeConfig.safeBlockVertical,
                decoration: boxDecoration,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 2 * SizeConfig.safeBlockVertical,
                    left: 3 * SizeConfig.safeBlockHorizontal,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$time ${AllStrings.daqiqa[SharedPrefHelper.chosenLanguage]}",
                          style: TextStyle(
                            color: kPrimaryWithOpacityBottom,
                            fontWeight: FontWeight.bold,
                            fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
                          ),
                        ),
                        SizedBox(height: 0.5 * SizeConfig.safeBlockVertical),
                        Text(
                          "$money\n${AllStrings.berilganDaqiqaHajmi[SharedPrefHelper.chosenLanguage]}$time\n${AllStrings.amal30[SharedPrefHelper.chosenLanguage]}",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 3.35 * SizeConfig.safeBlockHorizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
