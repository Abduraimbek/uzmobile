import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/datas/tarif.dart';

class BodyTariff2 extends StatefulWidget {
  @override
  _BodyTariff2State createState() => _BodyTariff2State();
}

class _BodyTariff2State extends State<BodyTariff2> {
  Tarif _tariff;

  @override
  void initState() {
    super.initState();
    _tariff = Tarif()..initialize();
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
              color: kPrimaryWithOpacity,
            ),
          ),
          Expanded(
            flex: 5,
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
                      AllStrings.tariflar[SharedPrefHelper.chosenLanguage],
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
                query: _tariff.reference,
                itemBuilder: (
                  BuildContext context,
                  DataSnapshot snapshot,
                  Animation<double> animation,
                  int index,
                ) {
                  _tariff.snapshot(snapshot);
                  return tarifItem(
                    context: context,
                    code: _tariff.code,
                    image: _tariff.image,
                    tarifText: _tariff.tarifText,
                    title: _tariff.title,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tarifItem({
    context,
    String code,
    String image,
    String title,
    String tarifText,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .043,
        vertical: SizeConfig.screenHeight * .018,
      ),
      child: InkWell(
        onTap: () => launchUrl(
          context: context,
          ussdCode: code,
          dialogTitle: title,
          text: tarifText,
        ),
        child: Container(
          height: SizeConfig.screenHeight * .16,
          width: SizeConfig.screenWidth,
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
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: SizeConfig.screenHeight * .16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.screenWidth * .06,
                    ),
                    child: CachedNetworkImage(
                      height: 15 * SizeConfig.safeBlockVertical,
                      imageUrl: image,
                      fit: BoxFit.cover,
                      placeholder: (context, _) {
                        return Image.asset(
                          'assets/images/placeholder.png',
                          height: 15 * SizeConfig.safeBlockVertical,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: SizeConfig.screenHeight * .16,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * .02,
                      left: SizeConfig.screenWidth * .05,
                      right: SizeConfig.screenWidth * .01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: kDarkBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenWidth * .04,
                          ),
                        ),
                        Text(
                          tarifText,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: SizeConfig.screenWidth * .035,
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
      ),
    );
  }
}
