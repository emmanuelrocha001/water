import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../app_colors.dart';

class GoalInput extends StatefulWidget {
  @override
  _GoalInputState createState() => _GoalInputState();
}

class _GoalInputState extends State<GoalInput> {

  final _formKey = GlobalKey<FormState>();
  var _edit = false;


  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context);

    return ListTile(
      title: Form(
        key: _formKey,
        child: !_edit ? ListTile(
          leading: Text( 'Goal:', style: TextStyle( color: Colors.white,)),
          title: Container(
            padding: EdgeInsets.all(8),
            child: Text( '10', style: TextStyle( color: Colors.white,)),
            decoration: BoxDecoration(
              color: AppColors.SECONDARY_DARK,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          trailing: Text( 'OZ', style: TextStyle( color: Colors.white,)),
          onTap: () {
            setState(() {
              _edit = true;
            });
          },
        ) : TextFormField(
          style: TextStyle(
            color: Colors.white,
          ),
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Goal:',
            labelStyle: TextStyle(color: Colors.white),
            hintText: '',

            suffix: Container(
              // color: Colors.yellow,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: AppColors.SECONDARY_DARK,
                    margin: EdgeInsets.all(8.0),
                    child: FlatButton(
                      child: Text( 'CANCEL', style: TextStyle( color: Colors.white,)),
                      onPressed: () {
                        setState(() {
                          _edit = false;
                        });
                      },
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    color: styleTheme.primaryColor,
                    child: FlatButton(
                      child: Text( 'DONE', style: TextStyle( color: Colors.white,)),
                      onPressed: () {
                        _edit = false;
                      },
                    ),

                  ),


                ],
              ),
            ),
            isDense: true,

            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: styleTheme.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}