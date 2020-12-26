import 'package:flutter/material.dart';
import '../wave.dart';
// colors
import '../../providers/app_color.dart';

class Day extends StatefulWidget {
  final id;
  final date;
  Day({
    @required this.id,
    this.date,
  });

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.PRIMARY_DARK,
      alignment: Alignment.center,
      child: Container(
        child: Wave(
          id: widget.id,
          color: AppColor.PRIMARY_DARK,
          size: Size(115, 275),
          date: widget.date,
        ),
      ),
    );
  }
}
