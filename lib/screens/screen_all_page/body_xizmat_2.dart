import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/datas/xizmat.dart';

class BodyXizmat2 extends StatefulWidget {
  @override
  _BodyXizmat2State createState() => _BodyXizmat2State();
}

class _BodyXizmat2State extends State<BodyXizmat2> {
  Xizmat _xizmat;

  @override
  void initState() {
    super.initState();
    _xizmat = Xizmat()..initialize();
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
              color: kScaffoldBg,
            ),
          ),
          Expanded(
            flex: 7,
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
                      AllStrings.xizmatlar[SharedPrefHelper.chosenLanguage],
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
                query: _xizmat.reference,
                itemBuilder: (
                  BuildContext context,
                  DataSnapshot snapshot,
                  Animation<double> animation,
                  int index,
                ) {
                  _xizmat.snapshot(snapshot);
                  return xizmatItem(
                    context: context,
                    body: _xizmat.body,
                    title: _xizmat.title,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget xizmatItem({
    context,
    String body,
    String title,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.screenHeight * .017,
      ),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              scrollable: true,
              title: Text(title),
              content: Text(body),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AllStrings.yopish[SharedPrefHelper.chosenLanguage],
                    style: TextStyle(
                      color: kPrimaryWithOpacityBottom,
                      fontSize: 4 * SizeConfig.safeBlockHorizontal,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        child: Container(
          height: SizeConfig.screenHeight * .16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              SizeConfig.screenWidth * .05,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth * .05,
                height: SizeConfig.screenHeight * .16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      SizeConfig.screenWidth * .05,
                    ),
                    bottomLeft: Radius.circular(
                      SizeConfig.screenWidth * .05,
                    ),
                  ),
                  color: kPrimaryWithOpacity,
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * .01,
                      bottom: SizeConfig.screenHeight * .01,
                      left: SizeConfig.screenWidth * .03,
                      right: SizeConfig.screenWidth * .02,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kDarkBlue,
                            fontSize: SizeConfig.screenWidth * .045,
                          ),
                        ),
                        Text(
                          body,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
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
