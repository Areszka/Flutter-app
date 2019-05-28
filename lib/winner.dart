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
                    Text(
                      ' wygrało grę ',
                      style: Theme.of(context).textTheme.body1,
                    )
                  ]))
                : widget.winner == 1
                    ? Container(
                        child: Row(children: <Widget>[
                        Icon(Icons.clear, color: Colors.red, size: 30.0),
                        Text(
                          ' wygrał grę ',
                          style: Theme.of(context).textTheme.body1,
                        )
                      ]))
                    : Text(
                        'Nikt nie wygrał',
                        style: Theme.of(context).textTheme.body1,
                      )
          ],
        ));
  }
}
