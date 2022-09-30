import 'package:flutter/cupertino.dart';

class AnalyticContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var controlPoint1 = Offset(width / 2, height - height * 0.2);
    var endPoint = Offset(0 + width * 0.2, height);

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(width - width * 0.20, height)
      ..quadraticBezierTo(
          controlPoint1.dx, controlPoint1.dy, endPoint.dx, endPoint.dy)
      ..lineTo(0, height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
