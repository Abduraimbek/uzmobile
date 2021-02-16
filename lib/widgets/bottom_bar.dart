import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';

import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;

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
                      _launchURL("+998888334240", context);
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
                      _launchURL("*100#", context);
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
                      _launchURL("*103#", context);
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

_launchURL(String uSSDCode, context) async {
  // Replace 12345678 with your tel. no.

  if (await Permission.phone.request().isGranted) {
    android_intent.Intent()
      ..setAction(android_action.Action.ACTION_CALL)
      ..setData(Uri(scheme: "tel", path: uSSDCode))
      ..startActivity().catchError((e) => print(e));
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
}
