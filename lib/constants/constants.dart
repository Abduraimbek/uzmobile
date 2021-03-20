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

const Color kPrimary = Color(0xff1484c6);
Color kPrimaryWithOpacityBottom = Color(0xff1484c6).withOpacity(0.8);
Color kPrimaryWithOpacity = Color(0xff1484c6).withOpacity(0.4);
const Color kScaffoldBg = Color(0xfff9f9f9);
const Color kDarkBlue = Color(0xff060c0f);

BoxDecoration boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(
    4 * SizeConfig.safeBlockHorizontal,
  ),
  border: Border.all(
    color: kPrimaryWithOpacityBottom,
    width: 0.3 * SizeConfig.safeBlockHorizontal,
  ),
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
        text: text != null ? text : null,
        noButtonText: AllStrings.yuq[SharedPrefHelper.chosenLanguage],
        yesButtonText:
            AllStrings.aktivlashtirish[SharedPrefHelper.chosenLanguage],
      ),
    );
  }
}
