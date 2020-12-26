import 'package:flutter/material.dart';
// widget
import 'loading.dart';
// colors

class ActionButton extends StatelessWidget {
  final Function function;
  final isLoading;
  final title;
  final grey;

  ActionButton({
    this.function,
    this.isLoading = false,
    this.title,
    this.grey = false,
  });

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        color: grey ? Colors.grey[300] : styleTheme.primaryColor,
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 36,
            child: isLoading
                ? Container(
                    width: 32,
                    height: 32,
                    padding: EdgeInsets.all(4.0),
                    child: Loading(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '$title',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ),
        onPressed: function,
      ),
    );
  }
}
