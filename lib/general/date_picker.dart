import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/color.dart';
// widgets
import 'action_button.dart';
import 'left_label.dart';

class DatePicker extends StatefulWidget {
  final setDate;
  DatePicker({
    @required this.setDate,
  });
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _datePicked;

  void _showCalendar() {
    showDatePicker(
      builder: (context, child) {
        return Consumer<AppColor>(
          builder: (context, color, _) => Theme(
            data: ThemeData(
              primarySwatch: color.appColor,
              // accentColor: Colors.black,
              brightness: Brightness.dark,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            child: child,
          ),
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    ).then((datePicked) {
      if (datePicked != null) {
        setState(() {
          widget.setDate(datePicked);
          _datePicked = datePicked;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LeftLabel(label: 'Date of Birth'),
        ActionButton(
          title: 'Pick a Date',
          function: _showCalendar,
        ),
        if (_datePicked != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat('MM/dd/yyyy').format(_datePicked),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }
}
