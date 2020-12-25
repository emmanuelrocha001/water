import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final colored;
  Loading({this.colored = false});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context);
    return Container(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white.withOpacity(.5),
        valueColor: new AlwaysStoppedAnimation<Color>(
            colored ? styleTheme.primaryColor : Colors.white),
        strokeWidth: 3,
      ),
    );
  }
}
