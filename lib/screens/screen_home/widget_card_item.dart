import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';

class WidgetCardItem extends StatelessWidget {
  final IconData iconData;
  final String title;

  const WidgetCardItem({
    Key key,
    @required this.iconData,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
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
    );
  }
}
