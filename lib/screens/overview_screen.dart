import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../widgets/wave.dart';
import '../app_colors.dart';
import '../widgets/five_day/five_day.dart';
class OverviewScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_DARK,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_DARK,
        leading: IconButton(
          icon: Icon(
            Feather.menu,
            color: styleTheme.primaryColor,
          ),
          onPressed: () {

          },
        ),
        actions: [
          FlatButton(
            child: Text('Welcome, Emmanuel',style: TextStyle(color: Colors.white),),
            onPressed: null,
          ),
          FlatButton(
            child: Text('Daily Goal',style: TextStyle(color: styleTheme.primaryColor),),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(
              Feather.calendar,
              color: styleTheme.primaryColor,
            ),
            onPressed: () {

            },
          ),
        ],


      ),


      body: SafeArea(
        child: FiveDay(),
      ),
    );
  }
}