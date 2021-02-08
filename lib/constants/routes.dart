import 'package:flutter/widgets.dart';
import 'package:uzmobile/screens/screen_home/screen_home.dart';
import 'package:uzmobile/screens/screen_language_choose/ScreenLanguageChoose.dart';

final Map<String, WidgetBuilder> routes = {
  ScreenLanguageChoose.routeName: (context) => ScreenLanguageChoose(),
  ScreenHome.routeName: (context) => ScreenHome(),
};
