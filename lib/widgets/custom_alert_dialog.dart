import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';

class CustomAlertDialog extends StatelessWidget {
  final Function yesButton;
  final String yesButtonText;
  final Function noButton;
  final String noButtonText;
  final String title;

  const CustomAlertDialog({
    Key key,
    @required this.yesButton,
    @required this.noButton,
    @required this.title,
    @required this.yesButtonText,
    @required this.noButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      actions: [
        FlatButton(
          onPressed: noButton,
          child: Text(
            noButtonText,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        FlatButton(
          onPressed: yesButton,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kMainBlueColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 15,
                vertical: SizeConfig.safeBlockVertical * 1.5,
              ),
              child: Text(
                yesButtonText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
