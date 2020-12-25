import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import './color_picker.dart';
import './goal_input.dart';

class Menu extends StatelessWidget {
  void _logOut(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final styleTheme = Theme.of(context);
    return Column(
      children: [
        Container(
          color: styleTheme.primaryColor,
          child: ListTile(
            trailing: IconButton(
              icon: Icon(
                Feather.x,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        // Container(
        //   width: 200,
        //   alignment: Alignment.centerLeft,
        //   child: Text( 'Color:', style: TextStyle( color: Colors.white,))
        // ),
        ListTile(
            leading: Text('Color:',
                style: TextStyle(
                  color: Colors.white,
                )),
            title: ColorPicker()),
        SizedBox(
          height: 30,
        ),
        GoalInput(),

        FlatButton(
          onPressed: () {
            _logOut(context);
          },
          child: Text(
            'Sign Out',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
