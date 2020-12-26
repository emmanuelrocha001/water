import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flushbar/flushbar.dart';
// colors
import './providers/app_color.dart';

class Helper extends StatelessWidget {
  static void showMessage(BuildContext context, String message,
      {bool error: false}) {
    final mediaQuery = MediaQuery.of(context);
    final styleTheme = Theme.of(context);
    Flushbar(
      backgroundColor: styleTheme.primaryColor,
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),

      duration: new Duration(seconds: 2),
      margin: EdgeInsets.all(8),
      maxWidth: 400,
      flushbarPosition: FlushbarPosition.TOP,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      // boxShadows: [
      //   BoxShadow(

      //     color: Colors.black.withOpacity(.45),
      //     offset: Offset(3,3),
      //     blurRadius: 3
      //   )
      // ],

      borderRadius: 8,
      // title: 'Error message:',
      message: message,
    )..show(context);
  }

  static bool conditionalExectionScreen(BuildContext context,
      {Widget content, Function function}) {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            // height: (mediaQuery.size.height )*percent + MediaQuery.of(context).viewInsets.bottom,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 0),
              elevation: 1,
              // color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Scrollbar(
                  child: SingleChildScrollView(
                child: content,
              )),
            ),
          );
        }).then((confirmation) {
      if (confirmation == true) {
        function();
      }
    });
  }

  static void showActionScreen(BuildContext context, content,
      {bool resetLocalInventory = false}) {
    final mediaQuery = MediaQuery.of(context);
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            height: (mediaQuery.size.height - mediaQuery.padding.top),
            width: (mediaQuery.size.width),
            color: AppColor.PRIMARY_DARK,
            child: Scrollbar(
                child: SingleChildScrollView(
              child: content,
            )),
          );
        }).then((value) {
      if (value != null) {
        showMessage(context, value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
