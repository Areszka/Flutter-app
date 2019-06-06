import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UndoButton extends StatefulWidget {
  final int winner;
  final bool isSwitched;
  final Function undoMove;

  UndoButton(this.isSwitched, this.undoMove, this.winner);

  @override
  _UndoButtonState createState() => _UndoButtonState();
}

class _UndoButtonState extends State<UndoButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.winner == 0 ? true : false,
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(top: 40.0, left: 30.0),
        child: RaisedButton(
          onPressed: () {
            widget.undoMove();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          color: Colors.blue[500],
          textColor: widget.isSwitched ? Colors.white : Colors.black,
          highlightColor: Colors.blue[600],
          child: Icon(Icons.replay),
        ),
      ),
    );
  }
}
