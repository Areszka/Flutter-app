import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  final bool _borderBottom, _borderRight;
  final int id;
  final int board;
  final Function(int) nextTurn;

  Square(this._borderBottom, this._borderRight, this.nextTurn, this.id, this.board);
  @override
  _SquareBuild createState() => _SquareBuild(_borderBottom, _borderRight);
}

class _SquareBuild extends State<Square> {

  final bool bB, bR;

  _SquareBuild(this.bB, this.bR);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.board == 0) {
          widget.nextTurn(widget.id);
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
            child: widget.board == 1
                ? Icon(Icons.clear, color: Colors.red, size: 70.0)
                : widget.board == 2
                    ? Icon(Icons.tonality, color: Colors.green, size: 70.0)
                    :Text('')));
  }
}
