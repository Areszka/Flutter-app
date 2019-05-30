import 'package:flutter/material.dart';

import './circlePainter.dart';
import './crossPainter.dart';

class Shape extends StatefulWidget {
  final int board;
  Shape(this.board);
  @override
  _ShapeState createState() => _ShapeState();
}

class _ShapeState extends State<Shape> with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  Animation<double> _animation;

  void initState() {
    super.initState();
    var _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: widget.board == 1
            ? CrossPainter(_fraction, 10.0)
            : CirclePainter(_fraction, 10.0));
  }
}