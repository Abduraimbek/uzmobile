import 'package:flutter/widgets.dart';
import 'package:uzmobile/screens/screen_all_page/screen_all_page.dart';
import 'package:uzmobile/screens/screen_first_screen/screen_first_screen.dart';
import 'package:uzmobile/screens/screen_home/screen_home.dart';
import 'package:uzmobile/screens/screen_language_choose/ScreenLanguageChoose.dart';
import 'package:uzmobile/screens/settings_language/settings_language_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ScreenFirstScreen.routeName: (context) => ScreenFirstScreen(),
  ScreenLanguageChoose.routeName: (context) => ScreenLanguageChoose(),
  ScreenHome.routeName: (context) => ScreenHome(),
  SettingsLanguageScreen.routeName: (context) => SettingsLanguageScreen(),
  AllPageScreen.routeName: (context) => AllPageScreen(),
};
