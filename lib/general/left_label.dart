import 'package:flutter/material.dart';

class LeftLabel extends StatelessWidget {
  final label;
  final small;
  LeftLabel({
    @required this.label,
    this.small = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: small ? 80.0 : 100.0,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          '$label',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
