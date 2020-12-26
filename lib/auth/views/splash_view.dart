import 'package:flutter/material.dart';
// widgets
import '../../general/loading.dart';
import '../../general/logo.dart';
// colors
import '../../providers/app_color.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = 175.0;

    // final styleTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColor.SECONDARY_DARK,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: size,
                height: size,
                child: Logo(
                  size: 125.0,
                ),
              ),
              Container(
                width: size,
                height: size,
                child: Loading(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
