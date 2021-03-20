import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/widgets/custom_alert_dialog.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;

class BuildHomePageIconsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(SizeConfig.screenWidth * .3),
          bottomRight: Radius.circular(SizeConfig.screenWidth * .3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.screenWidth * .015,
          bottom: SizeConfig.screenWidth * .015,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: SizeConfig.screenWidth * .045),
            buildHomePageItem(
              FlutterIcons.customerservice_ant,
              () {
                _launchURL(
                  uSSDCode: "1099",
                  context: context,
                  dialogTitle: AllStrings
                      .operatorAlertDialog[SharedPrefHelper.chosenLanguage],
                  noButtonText: AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                  yesButtonText: AllStrings.ha[SharedPrefHelper.chosenLanguage],
                );
              },
            ),
            SizedBox(width: SizeConfig.screenWidth * .03),
            buildHomePageItem(
              FlutterIcons.credit_ent,
              () {
                _launchURL(
                  uSSDCode: "*107#",
                  context: context,
                  dialogTitle: AllStrings
                      .balanceAlertDialog[SharedPrefHelper.chosenLanguage],
                  noButtonText: AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                  yesButtonText: AllStrings
                      .aktivlashtirish[SharedPrefHelper.chosenLanguage],
                );
              },
            ),
            SizedBox(width: SizeConfig.screenWidth * .03),
            buildHomePageItem(
              FlutterIcons.ios_globe_ion,
              () {
                _launchURL(
                  uSSDCode: "*107#",
                  context: context,
                  dialogTitle:
                      AllStrings.mbAlertDialog[SharedPrefHelper.chosenLanguage],
                  noButtonText: AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                  yesButtonText: AllStrings
                      .aktivlashtirish[SharedPrefHelper.chosenLanguage],
                );
              },
            ),
            SizedBox(width: SizeConfig.screenWidth * .045),
          ],
        ),
      ),
    );
  }

  Widget buildHomePageItem(
    IconData iconData,
    Function onPressed,
  ) {
    return IconButton(
      icon: Icon(
        iconData,
        color: kPrimary,
        size: SizeConfig.screenWidth * .08,
      ),
      onPressed: onPressed,
    );
  }
}

_launchURL({
  String uSSDCode,
  context,
  String dialogTitle,
  String noButtonText,
  String yesButtonText,
}) async {
  // Replace 12345678 with your tel. no.

  if (Platform.isAndroid) {
    if (await Permission.phone.request().isGranted) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          title: dialogTitle,
          noButtonText: noButtonText,
          yesButtonText: yesButtonText,
          noButton: () {
            Navigator.pop(context);
          },
          yesButton: () {
            android_intent.Intent()
              ..setAction(android_action.Action.ACTION_CALL)
              ..setData(Uri(scheme: "tel", path: uSSDCode))
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
          launch("tel:$uSSDCode");
        },
        noButton: () {
          Navigator.pop(context);
        },
        title: dialogTitle,
        noButtonText: noButtonText,
        yesButtonText: yesButtonText,
      ),
    );
  }
}
