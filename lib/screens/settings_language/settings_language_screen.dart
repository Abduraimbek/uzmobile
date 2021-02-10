import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/strings.dart';

class SettingsLanguageScreen extends StatefulWidget {
  static String routeName = '/SettingsLanguageScreen';

  @override
  _SettingsLanguageScreenState createState() => _SettingsLanguageScreenState();
}

class _SettingsLanguageScreenState extends State<SettingsLanguageScreen> {
  int language;

  @override
  void initState() {
    super.initState();
    language = SharedPrefHelper.chosenLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AllStrings.til[language],
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            languageWidget(
              AllStrings.tillar[0],
              'Uzbek',
              language == 0,
              () {
                setState(() {
                  SharedPrefHelper.changeLanguage(SharedPrefHelper.uzbek);
                  Navigator.pop(context);
                });
              },
            ),
            Divider(thickness: 1.5),
            languageWidget(
              AllStrings.tillar[1],
              'Russian',
              language == 1,
              () {
                setState(() {
                  SharedPrefHelper.changeLanguage(SharedPrefHelper.russian);
                  Navigator.pop(context);
                });
              },
            ),
            Divider(thickness: 1.5),
            languageWidget(
              AllStrings.tillar[2],
              'English',
              language == 2,
              () {
                setState(() {
                  SharedPrefHelper.changeLanguage(SharedPrefHelper.english);
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget languageWidget(
    String languageTitle,
    String languageSubtitle,
    bool chosen,
    Function onPress,
  ) {
    return InkWell(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                languageTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Text(
                languageSubtitle,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          chosen
              ? Icon(
                  Icons.check,
                  size: 30,
                  color: kMainBlueColor,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
