import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/screens/screen_home/carousel.dart';

import 'widget_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 2.5 * SizeConfig.safeBlockVertical),
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          width: SizeConfig.screenWidth * 0.5,
        ),
        SizedBox(height: 1.5 * SizeConfig.safeBlockVertical),
        Padding(
          padding: EdgeInsets.only(
            left: 3 * SizeConfig.safeBlockHorizontal,
            right: 3 * SizeConfig.safeBlockHorizontal,
          ),
          child: Carousel(),
        ),
        SizedBox(height: 2.5 * SizeConfig.safeBlockVertical),
        Expanded(
          child: WidgetCard(),
        ),
      ],
    );
  }
}
