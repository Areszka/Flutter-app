import 'package:flutter/material.dart';
import './square.dart';

class Board extends StatefulWidget {
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  bool turn0 = true, isWinner = false;
  List<bool> board = new List(9);
  bool winner;

  isRowEqual(a, b, c) {
    return board[a] == board[b] && board[a] == board[c] && board[a] != null;
  }

  nextTurn(i) {
    setState(() {
      turn0 = !turn0;
      board[i] = turn0;
      if (isRowEqual(0, 1, 2)) {
        isWinner = true;
        winner = board[0];
      } else if (isRowEqual(0, 3, 6)) {
        isWinner = true;
        winner = board[0];
      } else if (isRowEqual(0, 4, 8)) {
        isWinner = true;
        winner = board[0];
      } else if (isRowEqual(1, 4, 7)) {
        isWinner = true;
        winner = board[1];
      } else if (isRowEqual(2, 4, 6)) {
        isWinner = true;
        winner = board[2];
      } else if (isRowEqual(2, 5, 8)) {
        isWinner = true;
        winner = board[2];
      } else if (isRowEqual(3, 4, 5)) {
        isWinner = true;
        winner = board[3];
      } else if (isRowEqual(6, 7, 8)) {
        winner = board[6];
        isWinner = true;
      } else if (!board.contains(null)) {
        isWinner = true;
      }
      if (winner == true && winner == false) {
        isWinner = true;
      }
      print(board);
    });
    return turn0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isWinner ? Winner(winner) : WhoseTurn(turn0, isWinner),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Square(true, true, nextTurn, 0),
              Square(true, true, nextTurn, 1),
              Square(true, false, nextTurn, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Square(true, true, nextTurn, 3),
              Square(true, true, nextTurn, 4),
              Square(true, false, nextTurn, 5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Square(false, true, nextTurn, 6),
              Square(false, true, nextTurn, 7),
              Square(false, false, nextTurn, 8),
            ],
          ),
        ]);
  }
}

class WhoseTurn extends StatefulWidget {
  final bool turn0, i;

  WhoseTurn(this.turn0, this.i);
  @override
  State<StatefulWidget> createState() {
    return _WhoseTurn();
  }
}

class _WhoseTurn extends State<WhoseTurn> {
  @override
  Widget build(BuildContext context) {
  print(widget.i);
    return Container(
        margin: EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Teraz jest runda ',
                style: TextStyle(fontSize: 25.0, fontFamily: 'Quicksand')),
            !widget.turn0
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

class Winner extends StatefulWidget {
  final bool turn0;

  Winner(this.turn0);
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
            widget.turn0
                ? Icon(Icons.tonality, color: Colors.green, size: 30.0)
                : Icon(
                    Icons.clear,
                    color: Colors.red,
                    size: 30.0,
                  ),
            Text(' wygrało grę ',
                style: TextStyle(fontSize: 25.0, fontFamily: 'Quicksand')),
          ],
        ));
  }
}
