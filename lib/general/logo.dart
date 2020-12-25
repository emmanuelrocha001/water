import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final size;
  Logo({
    this.size = 170.0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/images/logo.png',
        height: size,
        width: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
