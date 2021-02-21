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

class BodyInternet extends StatefulWidget {
  @override
  _BodyInternetState createState() => _BodyInternetState();
}

class _BodyInternetState extends State<BodyInternet> {
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
                          "Non Stop",
                          style: _currentPage == 2
                              ? textStyleSpotted
                              : textStyleUnSpotted,
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
        );
      },
    );
  }

  Widget internetItem({
    context,
    String money,
    String code,
    String mb,
  }) {
    return InkWell(
      onTap: () => launchUrl(
        context: context,
        ussdCode: code,
        dialogTitle: money,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 4 * SizeConfig.safeBlockHorizontal,
          right: 4 * SizeConfig.safeBlockHorizontal,
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
            SizedBox(width: 5 * SizeConfig.safeBlockHorizontal),
            Expanded(
              flex: 7,
              child: Container(
                height: 16 * SizeConfig.safeBlockVertical,
                decoration: boxDecoration,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 2 * SizeConfig.safeBlockVertical,
                    left: 4 * SizeConfig.safeBlockHorizontal,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mb,
                        style: TextStyle(
                          color: kBottomBarColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
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
