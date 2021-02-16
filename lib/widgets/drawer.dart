import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/screens/screen_all_page/screen_all_page.dart';
import 'package:uzmobile/screens/settings_language/settings_language_screen.dart';
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
                      icon: FlutterIcons.hash_fea,
                      title: AllStrings.uSSD[SharedPrefHelper.chosenLanguage],
                      onPress: () async {
                        await Navigator.pushNamed(
                          context,
                          AllPageScreen.routeName,
                          arguments: AllPageScreenArguments(
                            appBarTitle: AllStrings.uSSD,
                            chosenLanguage: SharedPrefHelper.chosenLanguage,
                          ),
                        );
                        onResult();
                        Navigator.pop(context);
                      },
                    ),
                    DrawerListItem(
                      icon: FlutterIcons.credit_card_fea,
                      title:
                          AllStrings.tariflar[SharedPrefHelper.chosenLanguage],
                      onPress: () async {
                        await Navigator.pushNamed(
                          context,
                          AllPageScreen.routeName,
                          arguments: AllPageScreenArguments(
                            appBarTitle: AllStrings.tariflar,
                            chosenLanguage: SharedPrefHelper.chosenLanguage,
                          ),
                        );
                        onResult();
                        Navigator.pop(context);
                      },
                    ),
                    DrawerListItem(
                      icon: FlutterIcons.library_add_mdi,
                      title:
                          AllStrings.xizmatlar[SharedPrefHelper.chosenLanguage],
                      onPress: () async {
                        await Navigator.pushNamed(
                          context,
                          AllPageScreen.routeName,
                          arguments: AllPageScreenArguments(
                            appBarTitle: AllStrings.xizmatlar,
                            chosenLanguage: SharedPrefHelper.chosenLanguage,
                          ),
                        );
                        onResult();
                        Navigator.pop(context);
                      },
                    ),
                    DrawerListItem(
                      icon: FlutterIcons.phone_fea,
                      title: AllStrings.daqiqa[SharedPrefHelper.chosenLanguage],
                      onPress: () async {
                        await Navigator.pushNamed(
                          context,
                          AllPageScreen.routeName,
                          arguments: AllPageScreenArguments(
                            appBarTitle: AllStrings.daqiqa,
                            chosenLanguage: SharedPrefHelper.chosenLanguage,
                          ),
                        );
                        onResult();
                        Navigator.pop(context);
                      },
                    ),
                    DrawerListItem(
                      icon: FlutterIcons.ios_globe_ion,
                      title:
                          AllStrings.internet[SharedPrefHelper.chosenLanguage],
                      onPress: () async {
                        await Navigator.pushNamed(
                          context,
                          AllPageScreen.routeName,
                          arguments: AllPageScreenArguments(
                            appBarTitle: AllStrings.internet,
                            chosenLanguage: SharedPrefHelper.chosenLanguage,
                          ),
                        );
                        onResult();
                        Navigator.pop(context);
                      },
                    ),
                    DrawerListItem(
                      icon: FlutterIcons.sms_mdi,
                      title: AllStrings.sms[SharedPrefHelper.chosenLanguage],
                      onPress: () async {
                        await Navigator.pushNamed(
                          context,
                          AllPageScreen.routeName,
                          arguments: AllPageScreenArguments(
                            appBarTitle: AllStrings.sms,
                            chosenLanguage: SharedPrefHelper.chosenLanguage,
                          ),
                        );
                        onResult();
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
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
          ],
        ),
      ),
    );
  }
}
