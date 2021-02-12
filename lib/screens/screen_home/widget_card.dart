import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/size_config.dart';

import 'widget_card_item.dart';

class WidgetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 7.5 * SizeConfig.safeBlockHorizontal,
        right: 7.5 * SizeConfig.safeBlockHorizontal,
        bottom: 5 * SizeConfig.safeBlockVertical,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  3 * SizeConfig.safeBlockHorizontal,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 2 * SizeConfig.safeBlockHorizontal,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        WidgetCardItem(
                          iconData: FlutterIcons.hash_fea,
                          title: "USSD",
                        ),
                        WidgetCardItem(
                          iconData: FlutterIcons.credit_card_fea,
                          title: "Tarif",
                        ),
                        WidgetCardItem(
                          iconData: FlutterIcons.library_add_mdi,
                          title: "Xizmatlar",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        WidgetCardItem(
                          iconData: FlutterIcons.phone_fea,
                          title: "Daqiqa",
                        ),
                        WidgetCardItem(
                          iconData: FlutterIcons.ios_globe_ion,
                          title: "Internet",
                        ),
                        WidgetCardItem(
                          iconData: FlutterIcons.sms_mdi,
                          title: "SMS",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 2.0 * SizeConfig.safeBlockHorizontal,
            height: 2.0 * SizeConfig.safeBlockVertical,
            margin: EdgeInsets.symmetric(
              vertical: 1 * SizeConfig.safeBlockVertical,
              horizontal: .8 * SizeConfig.safeBlockHorizontal,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
