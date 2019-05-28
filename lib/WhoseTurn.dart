import 'package:flutter/material.dart';

class WhoseTurn extends StatefulWidget {
  final int turn0;

  WhoseTurn(this.turn0);
  @override
  State<StatefulWidget> createState() {
    return _WhoseTurn();
  }
}

class _WhoseTurn extends State<WhoseTurn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Teraz jest runda ',
                style: TextStyle(fontSize: 25.0, fontFamily: 'Quicksand')),
            widget.turn0 == 1
                ? Icon(Icons.tonality, color: Colors.green, size: 30.0)
                : Icon(
                    Icons.clear,
                    color: Colors.red,
                    size: 30.0,
                  ),
          ],
        ));
  }
}