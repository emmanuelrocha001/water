import 'package:flutter/material.dart';
import '../../general/app_colors.dart';

class Indicator extends StatelessWidget {
  final currentIndex;
  Indicator({@required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    double size = 12;

    return Container(
      // color: Colors.red,
      width: size * 5,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (ctx, index) {
          return Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            child: Container(
              width: size / 2,
              height: size / 2,
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? Colors.white
                    : Colors.white.withOpacity(.25),
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
