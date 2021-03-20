import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: SizeConfig.screenHeight * .3,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  double getX(Size size, double x) => size.width * x;

  double getY(Size size, double y) => size.height - (size.height * y);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.moveTo(getX(size, 0.1), getY(size, 0));
    path.lineTo(getX(size, 1), getY(size, 0));
    path.lineTo(getX(size, 1), getY(size, 1));
    path.quadraticBezierTo(
      getX(size, 19.6 / 20),
      getY(size, 9.85 / 10),
      getX(size, 19.6 / 20),
      getY(size, 0.96),
    );
    path.quadraticBezierTo(
      getX(size, 18 / 20),
      getY(size, 2 / 10),
      getX(size, 0.2),
      getY(size, 0.1),
    );
    path.quadraticBezierTo(
      getX(size, 2.5 / 20),
      getY(size, 0.1),
      getX(size, 0.1),
      getY(size, 0),
    );
    path.close();

    paint.color = kPrimaryWithOpacityBottom;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
