import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';

class WidgetCardItem2 extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function onPress;

  const WidgetCardItem2({
    Key key,
    @required this.iconData,
    @required this.title,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        3 * SizeConfig.safeBlockHorizontal,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockHorizontal * 4,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 1,
            bottom: SizeConfig.safeBlockVertical * 1,
            left: SizeConfig.safeBlockHorizontal * 1.5,
            right: SizeConfig.safeBlockHorizontal * 1.5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: onPress,
                child: Container(
                  decoration: BoxDecoration(
                    color: kCardIconBackColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3 * SizeConfig.safeBlockHorizontal),
                    child: Icon(
                      iconData,
                      color: kMainBlueColor,
                      size: 11 * SizeConfig.safeBlockHorizontal,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.8 * SizeConfig.safeBlockVertical),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
