import 'package:flutter/material.dart';
import 'dart:math';

class Shape extends StatefulWidget {
  final int board;
  Shape(this.board);
  @override
  _CrossState createState() => _CrossState();
}

class _CrossState extends State<Shape> with SingleTickerProviderStateMixin {
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
            ? CrossPainter(_fraction)
            : CirclePainter(_fraction));
  }
}

class CrossPainter extends CustomPainter {
  double _fraction;

  CrossPainter(this._fraction);

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    double firstLine, secondLine;

    if (_fraction < .5) {
      firstLine = _fraction / .5;
      print('first line: {$firstLine}');
      secondLine = 0.0;
    } else {
      firstLine = 1.0;
      secondLine = (_fraction - .5) / .5;
    }
    double x = size.width - 3.0;
    double y = size.height - 3.0;

    canvas.drawLine(
        Offset(3.0, 3.0), Offset(x * firstLine, y * firstLine), _paint);
    if (_fraction >= .5) {
      canvas.drawLine(
          Offset(x, 3.0), Offset(x - x * secondLine, y * secondLine), _paint);
    }
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}

class CirclePainter extends CustomPainter {
  double _fraction;
  
  CirclePainter(this._fraction);

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var rect = Offset(0.0, 0.0) & size;

    canvas.drawArc(rect, -pi / 2, pi * 2 * _fraction, false, _paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
