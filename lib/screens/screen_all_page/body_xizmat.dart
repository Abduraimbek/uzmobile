import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/datas/xizmat.dart';

class BodyXizmat extends StatefulWidget {
  @override
  _BodyXizmatState createState() => _BodyXizmatState();
}

class _BodyXizmatState extends State<BodyXizmat> {
  Xizmat _xizmat;

  @override
  void initState() {
    super.initState();
    _xizmat = Xizmat()..initialize();
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
          ),
        ),
      ],
    );
  }

  Widget xizmatItem({
    context,
    String title,
    String body,
  }) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            scrollable: true,
            title: Text(title),
            content: Text(body),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AllStrings.yopish[SharedPrefHelper.chosenLanguage],
                  style: TextStyle(
                    color: kMainBlueColor,
                    fontSize: 4 * SizeConfig.safeBlockHorizontal,
                  ),
                ),
              )
            ],
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 4 * SizeConfig.safeBlockHorizontal,
          right: 4 * SizeConfig.safeBlockHorizontal,
          bottom: 1.5 * SizeConfig.safeBlockVertical,
          top: 1.5 * SizeConfig.safeBlockVertical,
        ),
        child: Container(
          height: 10 * SizeConfig.safeBlockVertical,
          decoration: BoxDecoration(
            color: kMainBlueColor,
            borderRadius: BorderRadius.circular(
              4 * SizeConfig.safeBlockHorizontal,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 4 * SizeConfig.safeBlockHorizontal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
