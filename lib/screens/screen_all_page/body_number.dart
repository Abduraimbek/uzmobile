import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/constants/size_config.dart';
import 'package:uzmobile/constants/strings.dart';
import 'package:uzmobile/datas/nomer.dart';
import 'package:uzmobile/widgets/custom_alert_dialog.dart';

class BodyNumber extends StatefulWidget {
  final int numberCategory;

  const BodyNumber({
    Key key,
    @required this.numberCategory,
  }) : super(key: key);

  @override
  _BodyNumberState createState() => _BodyNumberState();
}

class _BodyNumberState extends State<BodyNumber> {
  bool _loading;

  String _money;
  List<String> _numberList;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Nomer()
      ..initialize(widget.numberCategory).then((_) {
        _money = Nomer.money;
        _numberList = Nomer.numbers.split(';');
        if (_numberList[_numberList.length - 1] == '') {
          _numberList.removeAt(_numberList.length - 1);
        }
        if (_numberList[0] == '') {
          _numberList.removeAt(0);
        }
        setState(() {
          _loading = false;
        });
      });
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
              child: _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _numberList.length,
                      itemBuilder: (_, index) => _numberItem(
                        context,
                        _money,
                        _numberList[index],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _numberItem(
  context,
  String money,
  String number,
) {
  return _cardNumber(
    context,
    money,
    number,
  );
}

Widget _cardNumber(
  context,
  String money,
  String number,
) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: 1.25 * SizeConfig.safeBlockVertical,
      top: 1.25 * SizeConfig.safeBlockVertical,
      left: 2.5 * SizeConfig.safeBlockHorizontal,
      right: 2.5 * SizeConfig.safeBlockHorizontal,
    ),
    child: Container(
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
      child: ExpansionTile(
        title: Padding(
          padding: EdgeInsets.only(
            bottom: 1 * SizeConfig.safeBlockVertical,
          ),
          child: Text(
            number,
            style: TextStyle(
              fontSize: 4.3 * SizeConfig.safeBlockHorizontal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        tilePadding: EdgeInsets.only(
          top: 1 * SizeConfig.safeBlockVertical,
          left: 5 * SizeConfig.safeBlockHorizontal,
          bottom: 1 * SizeConfig.safeBlockVertical,
        ),
        subtitle: Text(
          "${AllStrings.narxi[SharedPrefHelper.chosenLanguage]}: $money ${AllStrings.sum[SharedPrefHelper.chosenLanguage]}",
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        expandedAlignment: Alignment.centerRight,
        childrenPadding: EdgeInsets.only(
          right: 5 * SizeConfig.safeBlockHorizontal,
          bottom: 2 * SizeConfig.safeBlockVertical,
        ),
        children: [
          InkWell(
            onTap: () {
              //todo +998990807744
              launchUrl(
                ussdCode: '+998990807744',
                context: context,
                dialogTitle: AllStrings
                    .operatorAlertDialog[SharedPrefHelper.chosenLanguage],
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AllStrings
                      .operatorBilanBoglanish[SharedPrefHelper.chosenLanguage],
                  style: TextStyle(
                    fontSize: 4 * SizeConfig.safeBlockHorizontal,
                  ),
                ),
                SizedBox(width: 2 * SizeConfig.safeBlockHorizontal),
                Icon(
                  Icons.phone,
                  color: Colors.black54,
                )
              ],
            ),
          ),
          SizedBox(height: 2 * SizeConfig.safeBlockVertical),
          InkWell(
            onTap: () {
              //ofis manzilini google kartada ko'rsatish
              showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  title:
                      AllStrings.ofisManzili[SharedPrefHelper.chosenLanguage],
                  noButtonText: AllStrings.yuq[SharedPrefHelper.chosenLanguage],
                  yesButtonText: AllStrings.ha[SharedPrefHelper.chosenLanguage],
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AllStrings
                      .ofisManziliForNumber[SharedPrefHelper.chosenLanguage],
                  style: TextStyle(
                    fontSize: 4 * SizeConfig.safeBlockHorizontal,
                  ),
                ),
                SizedBox(width: 2 * SizeConfig.safeBlockHorizontal),
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
