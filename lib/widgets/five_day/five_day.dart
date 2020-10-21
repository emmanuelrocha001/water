import 'package:flutter/material.dart';
import './day.dart';
import './indicator.dart';

class FiveDay extends StatefulWidget {

  @override
  _FiveDayState createState() => _FiveDayState();
}

class _FiveDayState extends State<FiveDay> {
  final _controller = PageController(
    initialPage: 4,
    keepPage: true,
  );

  var currentIndex = 4;

  final days = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink,
  ];

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
                itemBuilder: (context, index) => Day(id: index, color: days[index],),
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