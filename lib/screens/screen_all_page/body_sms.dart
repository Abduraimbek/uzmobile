import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/datas/sms_kunlik.dart';
import 'package:uzmobile/datas/sms_oylik.dart';
import 'package:uzmobile/datas/sms_xalqaro.dart';

class BodySMS extends StatefulWidget {
  @override
  _BodySMSState createState() => _BodySMSState();
}

class _BodySMSState extends State<BodySMS> {
  SMSKunlik _smsKunlik;
  SMSOylik _smsOylik;
  SMSXalqaro _smsXalqaro;
  PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: false,
    );
    _smsKunlik = SMSKunlik()..initialize();
    _smsOylik = SMSOylik()..initialize();
    _smsXalqaro = SMSXalqaro()..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10 * SizeConfig.safeBlockVertical,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 5 * SizeConfig.safeBlockHorizontal,
                    right: 2 * SizeConfig.safeBlockHorizontal,
                    top: 1.5 * SizeConfig.safeBlockVertical,
                    bottom: 3.7 * SizeConfig.safeBlockVertical,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pageController.animateToPage(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      });
                    },
                    child: Container(
                      decoration: _currentPage == 0
                          ? decorationSpotted
                          : decorationUnSpotted,
                      child: Center(
                        child: Text(
                          AllStrings.kunlik[SharedPrefHelper.chosenLanguage],
                          style: _currentPage == 0
                              ? textStyleSpotted
                              : textStyleUnSpotted,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 3.5 * SizeConfig.safeBlockHorizontal,
                    right: 3.5 * SizeConfig.safeBlockHorizontal,
                    top: 1.5 * SizeConfig.safeBlockVertical,
                    bottom: 3.7 * SizeConfig.safeBlockVertical,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      });
                    },
                    child: Container(
                      decoration: _currentPage == 1
                          ? decorationSpotted
                          : decorationUnSpotted,
                      child: Center(
                        child: Text(
                          AllStrings.oylik[SharedPrefHelper.chosenLanguage],
                          style: _currentPage == 1
                              ? textStyleSpotted
                              : textStyleUnSpotted,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 5 * SizeConfig.safeBlockHorizontal,
                    left: 2 * SizeConfig.safeBlockHorizontal,
                    top: 1.5 * SizeConfig.safeBlockVertical,
                    bottom: 3.7 * SizeConfig.safeBlockVertical,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pageController.animateToPage(
                          2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      });
                    },
                    child: Container(
                      decoration: _currentPage == 2
                          ? decorationSpotted
                          : decorationUnSpotted,
                      child: Center(
                        child: Text(
                          AllStrings.xalqaro[SharedPrefHelper.chosenLanguage],
                          style: _currentPage == 2
                              ? textStyleSpotted
                              : textStyleUnSpotted,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  pageViewItem0(),
                  pageViewItem1(),
                  pageViewItem2(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget pageViewItem0() {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: _smsKunlik.reference,
      itemBuilder: (
        BuildContext context,
        DataSnapshot snapshot,
        Animation<double> animation,
        int index,
      ) {
        _smsKunlik.snapshot(snapshot);

        return internetItem(
          context: context,
          money: _smsKunlik.money,
          code: _smsKunlik.code,
          sms: _smsKunlik.sms,
          checkOneDay: true,
        );
      },
    );
  }

  Widget pageViewItem1() {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: _smsOylik.reference,
      itemBuilder: (
        BuildContext context,
        DataSnapshot snapshot,
        Animation<double> animation,
        int index,
      ) {
        _smsOylik.snapshot(snapshot);

        return internetItem(
          context: context,
          money: _smsOylik.money,
          code: _smsOylik.code,
          sms: _smsOylik.sms,
          checkOneDay: false,
        );
      },
    );
  }

  Widget pageViewItem2() {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: _smsXalqaro.reference,
      itemBuilder: (
        BuildContext context,
        DataSnapshot snapshot,
        Animation<double> animation,
        int index,
      ) {
        _smsXalqaro.snapshot(snapshot);

        return internetItem(
          context: context,
          money: _smsXalqaro.money,
          code: _smsXalqaro.code,
          sms: _smsXalqaro.sms,
          checkOneDay: false,
        );
      },
    );
  }

  Widget internetItem({
    context,
    String money,
    String code,
    String sms,
    bool checkOneDay,
  }) {
    return InkWell(
      onTap: () => launchUrl(
        context: context,
        ussdCode: code,
        dialogTitle: sms,
        text:
            "$money\n${AllStrings.berilganSMS[SharedPrefHelper.chosenLanguage]}$sms\n${checkOneDay ? AllStrings.amal1[SharedPrefHelper.chosenLanguage] : AllStrings.amal30[SharedPrefHelper.chosenLanguage]}",
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
                    sms,
                    style: TextStyle(
                      color: kBottomBarColor,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sms,
                        style: TextStyle(
                          color: kBottomBarColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
                        ),
                      ),
                      SizedBox(height: 0.5 * SizeConfig.safeBlockVertical),
                      Text(
                        "$money\n${AllStrings.berilganSMS[SharedPrefHelper.chosenLanguage]}$sms\n${checkOneDay ? AllStrings.amal1[SharedPrefHelper.chosenLanguage] : AllStrings.amal30[SharedPrefHelper.chosenLanguage]}",
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
          ],
        ),
      ),
    );
  }
}
