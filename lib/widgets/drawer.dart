import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/firebase_arguments.dart';
import 'package:uzmobile/screens/settings_language/settings_language_screen.dart';
import 'package:uzmobile/widgets/custom_alert_dialog.dart';
import 'package:uzmobile/widgets/drawer_list_item.dart';

class CustomDrawer extends StatelessWidget {
  final Function() onResult;

  CustomDrawer({
    this.onResult,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      color: kMainBlueColor,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/uzmobile_blue.png'),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    DrawerListItem(
                      icon: Icons.email,
                      title: AllStrings
                          .bizBilanBoglanish[SharedPrefHelper.chosenLanguage],
                      onPress: () {
                        showDialog(
                          context: context,
                          builder: (_) => CustomAlertDialog(
                            title: AllStrings.qollabQuvvatlashMarkazi[
                                SharedPrefHelper.chosenLanguage],
                            noButtonText:
                                AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                            yesButtonText:
                                AllStrings.ha[SharedPrefHelper.chosenLanguage],
                            noButton: () {
                              Navigator.pop(context);
                            },
                            yesButton: () {
                              launch(
                                "mailto:Yunusov.sardor2016@yandex.ru",
                              );
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
                    DrawerListItem(
                      icon: Icons.share,
                      title:
                          AllStrings.shareApp[SharedPrefHelper.chosenLanguage],
                      onPress: () {
                        if (Platform.isAndroid) {
                          Share.share(
                            FirebaseInitialize.playMarketLink['link']
                                    .toString() ??
                                'App url on Play Market',
                          );
                        } else {
                          Share.share(
                            FirebaseInitialize.appStoreLink['link']
                                    .toString() ??
                                'App url on App Store',
                          );
                        }
                      },
                    ),
                    Divider(thickness: 1.5),
                    DrawerListItem(
                      icon: FlutterIcons.settings_sli,
                      title: AllStrings.til[SharedPrefHelper.chosenLanguage],
                      onPress: () async {
                        await Navigator.pushNamed(
                          context,
                          SettingsLanguageScreen.routeName,
                        );
                        onResult();
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(
                    4.0 * SizeConfig.safeBlockHorizontal,
                  ),
                  child: Text("Version 2.0.0"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// DrawerListItem(
// icon: FlutterIcons.hash_fea,
// title: AllStrings.uSSD[SharedPrefHelper.chosenLanguage],
// onPress: () async {
// await Navigator.pushNamed(
// context,
// AllPageScreen.routeName,
// arguments: AllPageScreenArguments(
// firebaseTable: FirebaseTables.ussd,
// ),
// );
// onResult();
// Navigator.pop(context);
// },
// ),
