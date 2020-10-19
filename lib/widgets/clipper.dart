import 'package:flutter/cupertino.dart';

class Clipper extends CustomClipper<Path> {

  final List<Offset> waveList;
  final radius;
  Clipper({
    this.waveList,
    this.radius=15,
  });

  @override
  getClip(Size size) {
    final Path path = Path();
    path.addPolygon(waveList, false);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height-radius);
    path.quadraticBezierTo(size.width, size.height,size.width-radius, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0.0, size.height, 0.0, size.height-radius);
    // path.lineTo(, size.height);






    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {

    return true;
  }

}