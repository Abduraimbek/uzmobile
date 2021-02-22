import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/datas/tarif.dart';

class BodyTarif extends StatefulWidget {
  @override
  _BodyTarifState createState() => _BodyTarifState();
}

class _BodyTarifState extends State<BodyTarif> {
  Tarif _tarif;

  @override
  void initState() {
    super.initState();
    _tarif = Tarif()..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6 * SizeConfig.safeBlockHorizontal),
                topRight: Radius.circular(6 * SizeConfig.safeBlockHorizontal),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 3 * SizeConfig.safeBlockVertical,
                bottom: 5 * SizeConfig.safeBlockVertical,
              ),
              child: FirebaseAnimatedList(
                shrinkWrap: true,
                query: _tarif.reference,
                itemBuilder: (
                  BuildContext context,
                  DataSnapshot snapshot,
                  Animation<double> animation,
                  int index,
                ) {
                  _tarif.snapshot(snapshot);
                  return tarifItem(
                    context: context,
                    code: _tarif.code,
                    image: _tarif.image,
                    tarifText: _tarif.tarifText,
                    title: _tarif.title,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget tarifItem({
    context,
    String code,
    String image,
    String tarifText,
    String title,
  }) {
    return InkWell(
      onTap: () => launchUrl(
        context: context,
        ussdCode: code,
        dialogTitle: title,
        text: tarifText,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 1.25 * SizeConfig.safeBlockVertical,
          top: 1.25 * SizeConfig.safeBlockVertical,
          left: 2.5 * SizeConfig.safeBlockHorizontal,
          right: 2.5 * SizeConfig.safeBlockHorizontal,
        ),
        child: Container(
          height: 15 * SizeConfig.safeBlockVertical,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              4 * SizeConfig.safeBlockHorizontal,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.1),
                blurRadius: 1.5 * SizeConfig.safeBlockHorizontal,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4 * SizeConfig.safeBlockHorizontal),
                  ),
                  child: CachedNetworkImage(
                    height: 15 * SizeConfig.safeBlockVertical,
                    imageUrl: image,
                    fit: BoxFit.cover,
                    placeholder: (context, _) {
                      return Image.asset(
                        'assets/images/placeholder.png',
                        height: 15 * SizeConfig.safeBlockVertical,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.8 * SizeConfig.safeBlockVertical),
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: kBottomBarColor,
                          fontSize: 4 * SizeConfig.safeBlockHorizontal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.3 * SizeConfig.safeBlockVertical),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4 * SizeConfig.safeBlockHorizontal,
                      ),
                      child: Text(
                        tarifText,
                        maxLines: 3,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
