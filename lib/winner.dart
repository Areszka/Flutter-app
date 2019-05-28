import 'package:flutter/material.dart';

class Winner extends StatefulWidget {
  final int winner;

  Winner(this.winner);
  @override
  State<StatefulWidget> createState() {
    return _WinnerState();
  }
}

class _WinnerState extends State<Winner> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.winner == 2
                ? Container(
                    child: Row(children: <Widget>[
                    Icon(Icons.tonality, color: Colors.green, size: 30.0),
                    Text(' wygrało grę ',
                        style:
                            TextStyle(fontSize: 25.0, fontFamily: 'Quicksand'))
                  ]))
                : widget.winner == 1
                    ? Container(
                        child: Row(children: <Widget>[
                        Icon(Icons.clear, color: Colors.red, size: 30.0),
                        Text(' wygrał grę ',
                            style: TextStyle(
                                fontSize: 25.0, fontFamily: 'Quicksand'))
                      ]))
                    : Text('Nikt nie wygrał',
                        style:
                            TextStyle(fontSize: 25.0, fontFamily: 'Quicksand'))
          ],
        ));
  }
}
