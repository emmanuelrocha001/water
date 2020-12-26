import 'package:flutter/material.dart';

class AppColor with ChangeNotifier {
  static const Color PRIMARY_DARK = Color(0xFF494949);
  static const Color SECONDARY_DARK = Color(0xFF5B5B5B);
  var _appColor = Colors.blue;
  var _colorIndex = 0;

  List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lime,
    Colors.teal,
    Colors.cyan,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.indigo,
    Colors.purple,
    Colors.deepPurple,
    Colors.blueGrey,
    Colors.grey,
    Colors.green,
    Colors.brown,
    Colors.pink,
  ];

  Color get appColor {
    return _appColor;
  }

  int get colorIndex {
    return _colorIndex;
  }

  List<Color> get colors {
    return [..._colors];
  }

  void setColor(int index) {
    _appColor = _colors[index];
    _colorIndex = index;
    notifyListeners();
  }
}
