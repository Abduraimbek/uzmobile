import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/widgets/bottom_bar.dart';

class AllPageScreen extends StatelessWidget {
  static String routeName = '/AllPageScreen';

  @override
  Widget build(BuildContext context) {
    final AllPageScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.appBarTitle),
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
      bottomNavigationBar: BottomBar(),
    );
  }
}

class AllPageScreenArguments {
  final String appBarTitle;

  AllPageScreenArguments(this.appBarTitle);
}
