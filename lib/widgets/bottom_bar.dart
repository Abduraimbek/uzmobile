import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/settings_language/settings_language_screen.dart';

import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      color: Colors.transparent,
      elevation: 9,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: kMainBlueColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 40,
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
                          FlutterIcons.ios_person_ion,
                          color: Colors.white,
                          size: 30,
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
                          size: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 40,
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
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SettingsLanguageScreen.routeName,
                      );
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FlutterIcons.ios_settings_ion,
                          color: Colors.white,
                          size: 30,
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
          size: 70,
        ),
      ),
    );
  }
}
