// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:uzmobile/constants/constants.dart';
// import 'package:uzmobile/constants/shared_preferences.dart';
// import 'package:uzmobile/constants/size_config.dart';
// import 'package:uzmobile/constants/strings.dart';
// import 'package:uzmobile/screens/screen_all_page/screen_all_page.dart';
// import 'package:uzmobile/screens/screen_language_choose/ScreenLanguageChoose.dart';
// import 'package:uzmobile/screens/settings_language/settings_language_screen.dart';
// import 'package:uzmobile/widgets/drawer_list_item.dart';
//
// class CustomDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: SizeConfig.screenWidth,
//       height: SizeConfig.screenHeight,
//       color: kMainBlueColor,
//       child: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Image.asset('assets/images/uzmobile_blue.png'),
//             Expanded(
//               child: Container(
//                 color: Colors.white,
//                 child: ListView(
//                   children: [
//                     DrawerListItem(
//                       icon: FlutterIcons.hash_fea,
//                       title: AllStrings.uSSD[SharedPrefHelper.chosenLanguage],
//                       onPress: () {
//                         Navigator.popAndPushNamed(
//                           context,
//                           AllPageScreen.routeName,
//                           arguments: AllPageScreenArguments(
//                             AllStrings.uSSD[SharedPrefHelper.chosenLanguage],
//                           ),
//                         );
//                       },
//                     ),
//                     DrawerListItem(
//                       icon: FlutterIcons.credit_card_fea,
//                       title:
//                           AllStrings.tariflar[SharedPrefHelper.chosenLanguage],
//                       onPress: () {
//                         Navigator.popAndPushNamed(
//                           context,
//                           AllPageScreen.routeName,
//                           arguments: AllPageScreenArguments(
//                             AllStrings
//                                 .tariflar[SharedPrefHelper.chosenLanguage],
//                           ),
//                         );
//                       },
//                     ),
//                     DrawerListItem(
//                       icon: FlutterIcons.library_add_mdi,
//                       title:
//                           AllStrings.xizmatlar[SharedPrefHelper.chosenLanguage],
//                       onPress: () {
//                         Navigator.popAndPushNamed(
//                           context,
//                           AllPageScreen.routeName,
//                           arguments: AllPageScreenArguments(
//                             AllStrings
//                                 .xizmatlar[SharedPrefHelper.chosenLanguage],
//                           ),
//                         );
//                       },
//                     ),
//                     DrawerListItem(
//                       icon: FlutterIcons.phone_fea,
//                       title: AllStrings.daqiqa[SharedPrefHelper.chosenLanguage],
//                       onPress: () {
//                         Navigator.popAndPushNamed(
//                           context,
//                           AllPageScreen.routeName,
//                           arguments: AllPageScreenArguments(
//                             AllStrings.daqiqa[SharedPrefHelper.chosenLanguage],
//                           ),
//                         );
//                       },
//                     ),
//                     DrawerListItem(
//                       icon: FlutterIcons.ios_globe_ion,
//                       title:
//                           AllStrings.internet[SharedPrefHelper.chosenLanguage],
//                       onPress: () {
//                         Navigator.popAndPushNamed(
//                           context,
//                           AllPageScreen.routeName,
//                           arguments: AllPageScreenArguments(
//                             AllStrings
//                                 .internet[SharedPrefHelper.chosenLanguage],
//                           ),
//                         );
//                       },
//                     ),
//                     DrawerListItem(
//                       icon: FlutterIcons.sms_mdi,
//                       title: AllStrings.sms[SharedPrefHelper.chosenLanguage],
//                       onPress: () {
//                         Navigator.popAndPushNamed(
//                           context,
//                           AllPageScreen.routeName,
//                           arguments: AllPageScreenArguments(
//                             AllStrings.sms[SharedPrefHelper.chosenLanguage],
//                           ),
//                         );
//                       },
//                     ),
//                     Divider(
//                       thickness: 1.5,
//                     ),
//                     DrawerListItem(
//                       icon: FlutterIcons.settings_sli,
//                       title: AllStrings.til[SharedPrefHelper.chosenLanguage],
//                       onPress: () {
//                         Navigator.popAndPushNamed(
//                           context,
//                           SettingsLanguageScreen.routeName,
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
