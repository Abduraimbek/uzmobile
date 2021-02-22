import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';

final List<String> imgList = [
  "https://firebasestorage.googleapis.com/v0/b/uzmobile2-f04e7.appspot.com/o/minut.jpg?alt=media&token=d200117e-f5e7-420d-a72f-a94c9075ceab",
  "https://firebasestorage.googleapis.com/v0/b/uzmobile2-f04e7.appspot.com/o/street.jpg?alt=media&token=176d48a3-00e3-4d1a-945c-f41b88a160e9",
  "https://firebasestorage.googleapis.com/v0/b/uzmobile2-f04e7.appspot.com/o/Uzmobil_2.jpg?alt=media&token=cb6ed5f7-0511-47ef-9582-803a3d79ae2b",
  "https://firebasestorage.googleapis.com/v0/b/uzmobile2-f04e7.appspot.com/o/uzmobile3.jpg?alt=media&token=4f327244-2f5f-4fe6-8b7e-2a60d8ff7875",
  "https://firebasestorage.googleapis.com/v0/b/uzmobile2-f04e7.appspot.com/o/ishbilarmon.jpg?alt=media&token=73d6bafd-f947-4430-8812-1580227c6794",
  "https://firebasestorage.googleapis.com/v0/b/uzmobile2-f04e7.appspot.com/o/streetUpgrate.jpg?alt=media&token=ba724565-f4a5-41be-a05e-a438783c5a08",
];

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            autoPlay: true,
            height: 20 * SizeConfig.safeBlockVertical,
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 5),
            enlargeCenterPage: false,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return Container(
            width: 2.0 * SizeConfig.safeBlockHorizontal,
            height: 2.0 * SizeConfig.safeBlockVertical,
            margin: EdgeInsets.symmetric(
              vertical: 1 * SizeConfig.safeBlockVertical,
              horizontal: .8 * SizeConfig.safeBlockHorizontal,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index ? kBottomBarColor : kCardIconBackColor,
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(3 * SizeConfig.safeBlockHorizontal),
              ),
              child: CachedNetworkImage(
                imageUrl: item,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, _) {
                  return Image.asset(
                    'assets/images/placeholder.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ))
    .toList();
