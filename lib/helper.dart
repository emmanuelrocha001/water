import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flushbar/flushbar.dart';
import 'app_colors.dart';

class ActionButton extends StatelessWidget {
  final loading;
  final text;
  final data;
  final Function function;
  final colored;
  ActionButton({this.loading, this.function, this.text, this.data, this.colored=false});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context);
    return  Card(
      elevation: 5,
      color: colored ? styleTheme.primaryColor : Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 15,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ListTile(
        title: Center(
          child: loading ?
          Container(
            width: 32,
            height: 32,
            // color: Colors.white,
            // margin: EdgeInsets.only(bottom: 30),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white.withOpacity(.5),
              strokeWidth: 3,
              valueColor: new AlwaysStoppedAnimation<Color>(colored ? Colors.white : styleTheme.primaryColor),
              ),
            )
          :Text('$text', style: TextStyle(color: colored ? Colors.white : styleTheme.primaryColor, fontSize: 16, fontWeight: FontWeight.w600),),
          ),
        onTap: () {
          data != null ? function(data) : function();
        }
      ),
    );
  }
}

class Helper extends StatelessWidget {

  static void showMessage(BuildContext context, String message, {bool white=false, bool long=false}) {
    final styleTheme = Theme.of(context);
        Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)
              )),
              backgroundColor: white ? Colors.white : styleTheme.primaryColor,
              content: Text(message, textAlign: TextAlign.center, style: TextStyle(color: white ? styleTheme.primaryColor : Colors.white),),
              duration: Duration(seconds: long ? 3 : 2),
            )
    );

  }

  static void showMessageTop(BuildContext context, String message,{bool error: false, long: false, white: true}) {
    final mediaQuery = MediaQuery.of(context);
    final styleTheme = Theme.of(context);
    Flushbar(
      backgroundColor: Colors.white,
      messageText: Text(message, style: TextStyle(color: styleTheme.primaryColor),),

      duration: new Duration(seconds: 2),
      margin: EdgeInsets.all(8),
      // maxWidth: 400,
      flushbarPosition: FlushbarPosition.TOP,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      borderRadius: 8,
      // title: 'Error message:',
      message: message,


    )..show(context);

  }


  static bool conditionalExectionScreen(BuildContext context, {Widget content, Function function}) {
    showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context, builder: (ctx) {
      return Container(
        // height: (mediaQuery.size.height )*percent + MediaQuery.of(context).viewInsets.bottom,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 0),
          elevation: 1,
          // color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)
            )),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: content,
            )
          ),

        ),
      );
    }).then((confirmation) {
      if(confirmation == true) {
        function();
      }
    });

  }



  static void showActionScreen(BuildContext context, content, {bool resetLocalInventory=false}) {
    final mediaQuery = MediaQuery.of(context);
    showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context, builder: (ctx) {
      return Container(
          height: (mediaQuery.size.height - mediaQuery.padding.top),
          width: (mediaQuery.size.width),
          color: AppColors.PRIMARY_DARK,
          child: Scrollbar(
            child: SingleChildScrollView(
      child: content,
            )
          ),
        );
    }).then((value) {
      if(value != null) {
        showMessageTop(context, value);
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}