import 'package:flutter/material.dart';
import 'package:uzmobile/constants/size_config.dart';

class DrawerListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPress;

  const DrawerListItem({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Icon(
          icon,
          size: 7 * SizeConfig.safeBlockHorizontal,
        ),
      ),
      title: Text(
        title,
      ),
    );
  }
}
