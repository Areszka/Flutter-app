import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  final bool _borderBottom, _borderRight;
  final int id;
  final Function(int) nextTurn;

  Square(this._borderBottom, this._borderRight, this.nextTurn, this.id);
  @override
  _SquareBuild createState() => _SquareBuild(_borderBottom, _borderRight);
}

class _SquareBuild extends State<Square> {
  String _squareInside = "empty";

  final bool bB, bR;

  _SquareBuild(this.bB, this.bR);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (_squareInside == 'empty') {
          bool turn0 = widget.nextTurn(widget.id);
          
          setState(() {
              turn0 ? _squareInside = 'circle' : _squareInside = 'cross';
          });
          }
        },
        child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: bB ? Colors.black : Colors.white),
                right: BorderSide(color: bR ? Colors.black : Colors.white),
              ),
            ),
            child: _squareInside == 'cross'
                ? Icon(Icons.clear, color: Colors.red, size: 70.0)
                : _squareInside == 'circle'
                    ? Icon(Icons.tonality, color: Colors.green, size: 70.0)
                    :Text('')));
  }
}
