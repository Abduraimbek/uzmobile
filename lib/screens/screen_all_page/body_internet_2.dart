import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/datas/internet_kunlik.dart';
import 'package:uzmobile/datas/internet_non_stop.dart';
import 'package:uzmobile/datas/internet_oylik.dart';

class BodyInternet2 extends StatefulWidget {
  @override
  _BodyInternet2State createState() => _BodyInternet2State();
}

class _BodyInternet2State extends State<BodyInternet2> {
  InternetKunlik _internetKunlik;
  InternetOylik _internetOylik;
  InternetNonStop _internetNonStop;
  PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: false,
    );
    _internetKunlik = InternetKunlik()..initialize();
    _internetOylik = InternetOylik()..initialize();
    _internetNonStop = InternetNonStop()..initialize();
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
            flex: 6,
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
                      AllStrings.internet[SharedPrefHelper.chosenLanguage],
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
              height: SizeConfig.safeBlockVertical * 6,
              width: SizeConfig.safeBlockHorizontal * 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockHorizontal * 8,
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
              child: Row(
                children: [
                  Expanded(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              SizeConfig.safeBlockHorizontal * 8,
                            ),
                            bottomLeft: Radius.circular(
                              SizeConfig.safeBlockHorizontal * 8,
                            ),
                          ),
                          color: _currentPage != 0
                              ? kPrimaryWithOpacity
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            AllStrings.kunlik[SharedPrefHelper.chosenLanguage],
                            style: TextStyle(
                              color: kDarkBlue,
                              fontSize: SizeConfig.safeBlockHorizontal * 3.7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                        color: _currentPage != 1
                            ? kPrimaryWithOpacity
                            : Colors.white,
                        child: Center(
                          child: Text(
                            AllStrings.oylik[SharedPrefHelper.chosenLanguage],
                            style: TextStyle(
                              color: kDarkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.safeBlockHorizontal * 3.7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                              SizeConfig.safeBlockHorizontal * 8,
                            ),
                            topRight: Radius.circular(
                              SizeConfig.safeBlockHorizontal * 8,
                            ),
                          ),
                          color: _currentPage != 2
                              ? kPrimaryWithOpacity
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Non-Stop',
                            style: TextStyle(
                              color: kDarkBlue,
                              fontSize: SizeConfig.safeBlockHorizontal * 3.7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 2.5,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 83.5,
              width: SizeConfig.safeBlockHorizontal * 100,
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
          ],
        ),
      ),
    );
  }

  Widget pageViewItem0() {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: _internetKunlik.reference,
      itemBuilder: (
        BuildContext context,
        DataSnapshot snapshot,
        Animation<double> animation,
        int index,
      ) {
        _internetKunlik.snapshot(snapshot);

        return internetItem(
          context: context,
          money: _internetKunlik.money,
          code: _internetKunlik.code,
          mb: _internetKunlik.mb,
          checkOneDay: true,
        );
      },
    );
  }

  Widget pageViewItem1() {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: _internetOylik.reference,
      itemBuilder: (
        BuildContext context,
        DataSnapshot snapshot,
        Animation<double> animation,
        int index,
      ) {
        _internetOylik.snapshot(snapshot);

        return internetItem(
          context: context,
          money: _internetOylik.money,
          code: _internetOylik.code,
          mb: _internetOylik.mb,
          checkOneDay: false,
        );
      },
    );
  }

  Widget pageViewItem2() {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: _internetNonStop.reference,
      itemBuilder: (
        BuildContext context,
        DataSnapshot snapshot,
        Animation<double> animation,
        int index,
      ) {
        _internetNonStop.snapshot(snapshot);

        return internetItem(
          context: context,
          money: _internetNonStop.money,
          code: _internetNonStop.code,
          mb: _internetNonStop.mb,
          checkOneDay: false,
        );
      },
    );
  }

  Widget internetItem({
    context,
    String money,
    String code,
    String mb,
    bool checkOneDay,
  }) {
    return InkWell(
      onTap: () => launchUrl(
        context: context,
        ussdCode: code,
        dialogTitle: mb,
        text:
            "$money\n${AllStrings.berilganTrafikHajmi[SharedPrefHelper.chosenLanguage]}$mb\n${checkOneDay ? AllStrings.amal1[SharedPrefHelper.chosenLanguage] : AllStrings.amal30[SharedPrefHelper.chosenLanguage]}",
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
                    mb,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        mb,
                        style: TextStyle(
                          color: kPrimaryWithOpacityBottom,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
                        ),
                      ),
                      SizedBox(height: 0.5 * SizeConfig.safeBlockVertical),
                      Text(
                        "$money\n${AllStrings.berilganTrafikHajmi[SharedPrefHelper.chosenLanguage]}$mb\n${checkOneDay ? AllStrings.amal1[SharedPrefHelper.chosenLanguage] : AllStrings.amal30[SharedPrefHelper.chosenLanguage]}",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 2.7 * SizeConfig.safeBlockHorizontal,
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
