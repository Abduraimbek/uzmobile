import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';

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
              padding: const EdgeInsets.all(10),
              child: Icon(
                iconData,
                color: kMainBlueColor,
                size: 50,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextColor,
            ),
          )
        ],
      ),
    );
  }
}
