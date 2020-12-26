import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_color.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// colors
import '../../providers/app_color.dart';

import 'dart:math';

class ColorPicker extends StatefulWidget {
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  List<Color> _colors = [];
  var size = 24.0;
  var _colorSelected = 0;

  @override
  void initState() {
    super.initState();
    var color = Provider.of<AppColor>(context, listen: false);
    _colors = color.colors;
    _colorSelected = color.colorIndex;
  }

  void select(int index) {
    Provider.of<AppColor>(context, listen: false).setColor(index);
    setState(() {
      _colorSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: min(size * 2 * _colors.length, 300),
      height: size * 3,
      decoration: BoxDecoration(
        color: AppColor.SECONDARY_DARK,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Scrollbar(
        child: ListView.builder(
            itemCount: _colors.length,
            scrollDirection: Axis.horizontal,
            // padding: EdgeInsets.all(10.0),

            itemBuilder: (context, index) {
              var selected = false;
              if (index == _colorSelected) {
                selected = true;
              }
              return ColorChoice(
                selected: selected,
                size: size,
                color: _colors[index],
                index: index,
                select: select,
              );
            }),
      ),
    );
  }
}

class ColorChoice extends StatelessWidget {
  final color;
  final size;
  final selected;
  final index;
  final Function select;
  ColorChoice({
    @required this.color,
    @required this.size,
    @required this.selected,
    @required this.index,
    @required this.select,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        select(index);
      },
      child: Container(
        width: size * 2,
        height: size * 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size,
            height: size,
            child: selected
                ? Icon(
                    Feather.check,
                    color: Colors.white,
                  )
                : null,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
