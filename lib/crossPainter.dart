import 'package:flutter/material.dart';

class CrossPainter extends CustomPainter {
  double _fraction, _strokeWidth;

  CrossPainter(this._fraction, this._strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = _strokeWidth
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

    double x = size.width - 3;
    double y = size.height - 3;

    canvas.drawLine(
        Offset(3,3), Offset(x * firstLine, y * firstLine), _paint);
    if (_fraction >= .5) {
      canvas.drawLine(
          Offset(y, 3), Offset(x - x * secondLine + 3, y * secondLine), _paint);
    }
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}