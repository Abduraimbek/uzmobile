import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/screens/settings_language/settings_language_screen.dart';
import 'package:uzmobile/widgets/bottom_bar.dart';

class AllPageScreen extends StatefulWidget {
  static String routeName = '/AllPageScreen';

  @override
  _AllPageScreenState createState() => _AllPageScreenState();
}

class _AllPageScreenState extends State<AllPageScreen> {
  int choseLanguage;

  @override
  Widget build(BuildContext context) {
    final AllPageScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    choseLanguage = arguments.chosenLanguage;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments.appBarTitle[choseLanguage],
        ),
        backgroundColor: kMainBlueColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: kOrange,
        child: Icon(
          FlutterIcons.home_ant,
          size: 9 * SizeConfig.safeBlockHorizontal,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        onPressSettings: () async {
          await Navigator.pushNamed(
            context,
            SettingsLanguageScreen.routeName,
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}

class AllPageScreenArguments {
  final List<String> appBarTitle;
  final int chosenLanguage;

  AllPageScreenArguments({
    @required this.appBarTitle,
    @required this.chosenLanguage,
  });
}
