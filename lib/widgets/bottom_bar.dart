import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';

import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;
import 'package:uzmobile/widgets/custom_alert_dialog.dart';

class BottomBar extends StatelessWidget {
  final Function onPressSettings;

  const BottomBar({
    Key key,
    @required this.onPressSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 1.2 * SizeConfig.safeBlockVertical,
      color: Colors.transparent,
      elevation: 5 * SizeConfig.safeBlockHorizontal,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 8 * SizeConfig.safeBlockVertical,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7 * SizeConfig.safeBlockHorizontal),
            topRight: Radius.circular(7 * SizeConfig.safeBlockHorizontal),
          ),
          color: kBottomBarColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.screenWidth / 2 -
                  10 * SizeConfig.safeBlockHorizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _launchURL(
                        uSSDCode: "1099",
                        context: context,
                        dialogTitle: AllStrings.operatorAlertDialog[
                            SharedPrefHelper.chosenLanguage],
                        noButtonText:
                            AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                        yesButtonText:
                            AllStrings.ha[SharedPrefHelper.chosenLanguage],
                      );
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FlutterIcons.customerservice_ant,
                          color: Colors.white,
                          size: 8 * SizeConfig.safeBlockHorizontal,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL(
                        uSSDCode: "*107#",
                        context: context,
                        dialogTitle: AllStrings.balanceAlertDialog[
                            SharedPrefHelper.chosenLanguage],
                        noButtonText:
                            AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                        yesButtonText: AllStrings
                            .aktivlashtirish[SharedPrefHelper.chosenLanguage],
                      );
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FlutterIcons.credit_ent,
                          color: Colors.white,
                          size: 8 * SizeConfig.safeBlockHorizontal,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth / 2 -
                  10 * SizeConfig.safeBlockHorizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _launchURL(
                        uSSDCode: "*107#",
                        context: context,
                        dialogTitle: AllStrings
                            .mbAlertDialog[SharedPrefHelper.chosenLanguage],
                        noButtonText:
                            AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                        yesButtonText: AllStrings
                            .aktivlashtirish[SharedPrefHelper.chosenLanguage],
                      );
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FlutterIcons.ios_globe_ion,
                          color: Colors.white,
                          size: 8 * SizeConfig.safeBlockHorizontal,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onPressSettings,
                    // onTap: () {
                    //   Navigator.pushNamed(
                    //     context,
                    //     SettingsLanguageScreen.routeName,
                    //   );
                    // },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FlutterIcons.settings_sli,
                          color: Colors.white,
                          size: 8 * SizeConfig.safeBlockHorizontal,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
