import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final double horizontalMargin;

  RoundedButton({
    Key key,
    @required this.text,
    @required this.press,
    this.verticalPadding = 16,
    this.horizontalPadding = 30,
    this.fontSize = 16,
    this.horizontalMargin = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: horizontalMargin,
        ),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: kMainBlueColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 30,
              color: Color(0xFF666666).withOpacity(.11),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
