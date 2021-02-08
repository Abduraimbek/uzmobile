import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';

class ScreenHome extends StatefulWidget {
  static String routeName = '/ScreenHome';

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        backgroundColor: kMainBlueColor,
        onPressed: () {},
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        items: [],
      ),
    );
  }
}
