import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';

import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;
import 'package:uzmobile/widgets/custom_alert_dialog.dart';

const Color kMainBlueColor = Color(0xff00b4ff);

const Color kCardIconBackColor = Color(0xffccf0ff);

const Color kBottomBarColor = Color(0xff228bd6);

const Color kOrange = Color(0xffffd12d);

BoxDecoration decorationSpotted = BoxDecoration(
  borderRadius: BorderRadius.circular(
    1 * SizeConfig.safeBlockHorizontal,
  ),
  color: Colors.white,
);

BoxDecoration decorationUnSpotted = BoxDecoration(
  color: kMainBlueColor,
  borderRadius: BorderRadius.circular(
    2 * SizeConfig.safeBlockHorizontal,
  ),
  border: Border.all(
    color: Colors.white,
    width: 0.3 * SizeConfig.safeBlockHorizontal,
  ),
);

BoxDecoration boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(
    4 * SizeConfig.safeBlockHorizontal,
  ),
  border: Border.all(
    color: kBottomBarColor,
    width: 0.3 * SizeConfig.safeBlockHorizontal,
  ),
);

TextStyle textStyleSpotted = TextStyle(
  color: kMainBlueColor,
  fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
);

TextStyle textStyleUnSpotted = TextStyle(
  color: Colors.white,
  fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
);

void launchUrl({
  @required String ussdCode,
  @required context,
  @required String dialogTitle,
  String text,
}) async {
  if (Platform.isAndroid) {
    if (await Permission.phone.request().isGranted) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          title: dialogTitle,
          text: text != null ? text : null,
          noButtonText: AllStrings.yuq[SharedPrefHelper.chosenLanguage],
          yesButtonText:
              AllStrings.aktivlashtirish[SharedPrefHelper.chosenLanguage],
          noButton: () {
            Navigator.pop(context);
          },
          yesButton: () {
            android_intent.Intent()
              ..setAction(android_action.Action.ACTION_CALL)
              ..setData(Uri(scheme: "tel", path: ussdCode))
              ..startActivity().catchError((e) => print(e));
            Navigator.pop(context);
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            AllStrings.callPermissionDialog[SharedPrefHelper.chosenLanguage],
            textAlign: TextAlign.center,
          ),
          content: Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 20 * SizeConfig.safeBlockHorizontal,
          ),
        ),
      );
    }
  } else {
    if (await Permission.phone.request().isGranted) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          yesButton: () {
            launch("tel:$ussdCode");
          },
          noButton: () {
            Navigator.pop(context);
          },
          title: dialogTitle,
          noButtonText: AllStrings.yuq[SharedPrefHelper.chosenLanguage],
          yesButtonText:
              AllStrings.aktivlashtirish[SharedPrefHelper.chosenLanguage],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Text(
            AllStrings.callPermissionDialog[SharedPrefHelper.chosenLanguage],
          ),
          content: Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 20 * SizeConfig.safeBlockHorizontal,
          ),
        ),
      );
    }
  }
}
