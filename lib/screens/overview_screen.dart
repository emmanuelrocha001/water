import 'package:flutter/material.dart';
import '../widgets/wave.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water'),

      ),
      body: SafeArea(

        child: Center(
          child: Column(
            children: [
              // SizedBox.expand(),
              SizedBox(
                height: 60,
              ),
              Wave(
                size: new Size(
                  150,
                  300,
                ),
                color: Colors.blue,
              ),

            ],
          ),
        ),
      ),
    );
  }
}