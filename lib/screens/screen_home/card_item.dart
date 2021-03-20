import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';

class CardItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function onPress;

  const CardItem({
    Key key,
    @required this.iconData,
    @required this.text,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.screenHeight * .008,
          bottom: SizeConfig.screenHeight * .008,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: SizeConfig.screenWidth * .07),
            Icon(
              iconData,
              color: kPrimary,
              size: SizeConfig.screenWidth * 0.07,
            ),
            SizedBox(width: SizeConfig.screenWidth * .07),
            Text(
              text,
              style: TextStyle(
                color: kDarkBlue,
                fontSize: SizeConfig.screenWidth * .042,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
