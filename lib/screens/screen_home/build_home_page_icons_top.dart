import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/widgets/custom_alert_dialog.dart';

class BuildHomePageIconsTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.screenWidth * .3),
          bottomLeft: Radius.circular(SizeConfig.screenWidth * .3),
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
              FlutterIcons.telegram_mco,
              () {
                showDialog(
                  context: context,
                  builder: (_) => CustomAlertDialog(
                    title: AllStrings
                        .telegramAlertDialog[SharedPrefHelper.chosenLanguage],
                    noButtonText:
                        AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                    yesButtonText:
                        AllStrings.ha[SharedPrefHelper.chosenLanguage],
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
            SizedBox(width: SizeConfig.screenWidth * .03),
            buildHomePageItem(
              Icons.location_on_outlined,
              () {
                showDialog(
                  context: context,
                  builder: (_) => CustomAlertDialog(
                    title:
                        AllStrings.ofisManzili[SharedPrefHelper.chosenLanguage],
                    noButtonText:
                        AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                    yesButtonText:
                        AllStrings.ha[SharedPrefHelper.chosenLanguage],
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
