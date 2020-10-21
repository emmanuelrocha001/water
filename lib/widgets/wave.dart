import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../widgets/clipper.dart';
import '../app_colors.dart';

import 'dart:math' as Math;
class Wave extends StatefulWidget {
  final Size size;
  final Color color;
  final id;
  Wave({
    @required this.size,
    @required this.color,
    @required this.id,
  });

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> with TickerProviderStateMixin{

  AnimationController _controller;
  List<Offset> _wavePoints = [];
  var percent = 0.0;
  var ammount = .1;


  // add water
  void _editWater({decrement=false}) {
    if(decrement && percent-ammount >= 0) {
      setState(() {
        if(percent < 1) {
          percent -= ammount;
        }
      });
    } else if(!decrement && percent+ammount <= 1) {
      setState(() {
        if(percent < 1) {
          percent += ammount;
        }
      });
    }

    print('adding water');
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addListener(() {
      _wavePoints.clear();
      // calculate offset
      final yOffset = widget.size.height - (percent*widget.size.height);

      final double waveSpeed = _controller.value * 1080;
      final double fullSpehere = _controller.value * Math.pi * 2;
      final double normalizer = Math.cos(fullSpehere);
      final double waveWidth = Math.pi / 270;
      final double waveHeight = 15.0;

      for(int i=0; i<= widget.size.width.toInt(); i++) {
        double calc = Math.sin((waveSpeed - i) * waveWidth);
        _wavePoints.add(
          Offset(
            i.toDouble(),
          calc * waveHeight * normalizer + yOffset,
          )
        );
      }

    });
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }



  @override
  Widget build(BuildContext context) {

    final styleTheme = Theme.of(context);
    return Container(
      height: 400,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.SECONDARY_DARK,
              border: Border.all(
                color: AppColors.SECONDARY_DARK,
                width: 10,
              ),

              borderRadius: BorderRadius.circular(10)
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return ClipPath(
                  key: ValueKey(widget.id),
                  clipper: Clipper(
                      waveList: _wavePoints
                    ),
                    child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        color: Colors.blue,
                        width: widget.size.width,
                        height: widget.size.height,
                    ),
                );
              },

              ),

          ),
          Container(
            width: 300,
            margin: EdgeInsets.all(15),
            child: ListTile(
              leading:IconButton(
                onPressed: () {
                  _editWater(decrement: true);
                },
                icon: Icon(Feather.minus_circle, color: styleTheme.primaryColor,),

              ),

              trailing: IconButton(
                onPressed: () {
                  _editWater();
                },
                icon: Icon(Feather.plus_circle, color: styleTheme.primaryColor,),

              ),
            )
          )
        ],
      ),
    );
  }
}