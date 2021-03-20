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

class CustomDrawer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Container(
        color: Color(0xff1484c6).withOpacity(0.7),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.safeBlockVertical * 6),
              Container(
                child: Center(
                  child: Text(
                    'UZMOBILE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 9,
                    ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    AllStrings.milliyOperator[SharedPrefHelper.chosenLanguage],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 6),
              Expanded(
                child: Container(
                  color: kScaffoldBg,
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
                              noButtonText: AllStrings
                                  .yuq[SharedPrefHelper.chosenLanguage],
                              yesButtonText: AllStrings
                                  .ha[SharedPrefHelper.chosenLanguage],
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
                        title: AllStrings
                            .shareApp[SharedPrefHelper.chosenLanguage],
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
                      DrawerListItem(
                        icon: FlutterIcons.telegram_mco,
                        title: AllStrings
                            .telegramGuruh[SharedPrefHelper.chosenLanguage],
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (_) => CustomAlertDialog(
                              title: AllStrings.telegramAlertDialog[
                                  SharedPrefHelper.chosenLanguage],
                              noButtonText: AllStrings
                                  .yuq[SharedPrefHelper.chosenLanguage],
                              yesButtonText: AllStrings
                                  .ha[SharedPrefHelper.chosenLanguage],
                              noButton: () {
                                Navigator.pop(context);
                              },
                              yesButton: () {
                                launch(
                                  "https://t.me/uzmobile_xizmatlari",
                                );
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      ),
                      DrawerListItem(
                        icon: Icons.info_outline,
                        title: AllStrings
                            .bizHaqimizda[SharedPrefHelper.chosenLanguage],
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              scrollable: true,
                              title: Text(
                                AllStrings.bizHaqimizda[
                                    SharedPrefHelper.chosenLanguage],
                              ),
                              content: Text(
                                AllStrings.bizHaqimizdaBody[
                                    SharedPrefHelper.chosenLanguage],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    AllStrings.yopish[
                                        SharedPrefHelper.chosenLanguage],
                                    style: TextStyle(
                                      color: kPrimaryWithOpacityBottom,
                                      fontSize:
                                          4 * SizeConfig.safeBlockHorizontal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      DrawerListItem(
                        icon: Icons.location_on_outlined,
                        title: AllStrings
                            .location[SharedPrefHelper.chosenLanguage],
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (_) => CustomAlertDialog(
                              title: AllStrings
                                  .ofisManzili[SharedPrefHelper.chosenLanguage],
                              noButtonText: AllStrings
                                  .yuq[SharedPrefHelper.chosenLanguage],
                              yesButtonText: AllStrings
                                  .ha[SharedPrefHelper.chosenLanguage],
                              noButton: () {
                                Navigator.pop(context);
                              },
                              yesButton: () {
                                launch(
                                  "https://maps.app.goo.gl/NYxb4U3JkfdSC4H5A",
                                );
                                Navigator.pop(context);
                              },
                            ),
                          );
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
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
