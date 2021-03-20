import 'package:flutter/material.dart';
import 'package:uzmobile/constants/constants.dart';
import 'package:uzmobile/constants/size_config.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: SizeConfig.screenHeight * 0.32,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  double getX(Size size, double x) => size.width * x;

  double getY(Size size, double y) => size.height * y;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.moveTo(getX(size, 0), getY(size, 1));
    path.lineTo(getX(size, 0), getY(size, 0));
    path.lineTo(getX(size, 1), getY(size, 0));
    path.quadraticBezierTo(
      getX(size, 1),
      getY(size, 0.2),
      getX(size, 0.5),
      getY(size, 0.3),
    );
    path.quadraticBezierTo(
      getX(size, 2 / 20),
      getY(size, 0.4),
      getX(size, 1.5 / 20),
      getY(size, 0.8),
    );
    path.quadraticBezierTo(
      getX(size, 1.2 / 20),
      getY(size, 0.98),
      getX(size, 0),
      getY(size, 1),
    );

    path.close();

    paint.color = kPrimaryWithOpacity;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
