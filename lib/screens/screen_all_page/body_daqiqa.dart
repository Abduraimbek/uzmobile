import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/datas/daqiqa.dart';

class BodyDaqiqa extends StatefulWidget {
  @override
  _BodyDaqiqaState createState() => _BodyDaqiqaState();
}

class _BodyDaqiqaState extends State<BodyDaqiqa> {
  Daqiqa _daqiqa;

  @override
  void initState() {
    super.initState();
    _daqiqa = Daqiqa()..initialize();
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
          ),
        ),
      ],
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
        dialogTitle: money,
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
                      time.toString(),
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
                    money,
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
