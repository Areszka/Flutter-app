import 'package:flutter/material.dart';

class Winner extends StatefulWidget {
  final int winner;
  final String firstPlayer, secondPlayer;

  Winner(this.winner, this.firstPlayer, this.secondPlayer);
  @override
  State<StatefulWidget> createState() {
    return _WinnerState(firstPlayer, secondPlayer);
  }
}

class _WinnerState extends State<Winner> {
  final String firstPlayer, secondPlayer;
  _WinnerState(this.firstPlayer, this.secondPlayer);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(40.0),
        child: widget.winner == 2
            ? Text('Wygranym jest : $firstPlayer!')
            : Text('Wygranym jest $secondPlayer!'));
  }
}
