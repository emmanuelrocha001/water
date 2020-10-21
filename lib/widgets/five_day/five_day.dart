import 'package:flutter/material.dart';
import './day.dart';
import './indicator.dart';

class FiveDay extends StatefulWidget {

  @override
  _FiveDayState createState() => _FiveDayState();
}

class _FiveDayState extends State<FiveDay> {
  PageController _controller;
  List<DateTime> days;

  var currentIndex = 4;


  @override
  void initState() {
    super.initState();

    var l = 5;
    days = List.generate(l, (index) {
      return DateTime.now().subtract(Duration(days: l-index-1));
    });

    _controller = PageController(
      initialPage: days.length-1,
      keepPage: true,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: PageView.builder(

                controller: _controller,
                itemCount: days.length,
                itemBuilder: (context, index) => Day(id: index, date: days[index],),
                onPageChanged: (value) {
                  print(value);
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),
            ),
          ),
          Indicator(
            currentIndex: currentIndex,
          ),


        ],
      ),
    );
  }
}