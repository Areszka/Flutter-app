import 'package:flutter/material.dart';
import './square.dart';
import './WhoseTurn.dart';
import './winner.dart';
import './undoMoveButton.dart';
import 'dart:math';

class Board extends StatefulWidget {
  final String firstPlayer, secondPlayer;
  final bool isSwitched;
  Board(this.firstPlayer, this.secondPlayer, this.isSwitched);

  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final _random = Random();
  int turn0, winner = 0;

  List<int> board = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  final List<List<int>> moves = [[0, 0, 0, 0, 0, 0, 0, 0, 0],];

  void initState() {
    turn0 = _random.nextInt(2) + 1;
    super.initState();
  }

  isRowEqual(a, b, c) {
    return board[a] == board[b] && board[a] == board[c] && board[a] != 0;
  }

  nextTurn(i) {
    if (winner == 0) {
      setState(() {
        turn0 == 1 ? turn0 = 2 : turn0 = 1;
        board[i] = turn0;
        if (isRowEqual(0, 1, 2)) {
          winner = board[0];
        } else if (isRowEqual(0, 3, 6)) {
          winner = board[0];
        } else if (isRowEqual(0, 4, 8)) {
          winner = board[0];
        } else if (isRowEqual(1, 4, 7)) {
          winner = board[1];
        } else if (isRowEqual(2, 4, 6)) {
          winner = board[2];
        } else if (isRowEqual(2, 5, 8)) {
          winner = board[2];
        } else if (isRowEqual(3, 4, 5)) {
          winner = board[3];
        } else if (isRowEqual(6, 7, 8)) {
          winner = board[6];
        } else if (!board.contains(0)) {
          winner = 3;
        }
      });
        moves.add(List.of(board));
    }
  }

  undoMove() {
    setState(() {
      int len = moves.length;
      if (len > 1) {
        board = List.of(moves[len - 2]);
        moves.removeLast();
        turn0 == 1 ? turn0 = 2 : turn0 = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          winner != 0
              ? Winner(winner, widget.firstPlayer, widget.secondPlayer)
              : WhoseTurn(turn0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Square(true, true, nextTurn, 0, board[0]),
              Square(true, true, nextTurn, 1, board[1]),
              Square(true, false, nextTurn, 2, board[2]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Square(true, true, nextTurn, 3, board[3]),
              Square(true, true, nextTurn, 4, board[4]),
              Square(true, false, nextTurn, 5, board[5]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Square(false, true, nextTurn, 6, board[6]),
              Square(false, true, nextTurn, 7, board[7]),
              Square(false, false, nextTurn, 8, board[8]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        turn0 = _random.nextInt(2) + 1;
                        winner = 0;
                        board.fillRange(0, 9, 0);
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    color: Colors.blue[500],
                    padding: EdgeInsets.only(
                        top: 8.0, right: 15.0, bottom: 8.0, left: 15.0),
                    textColor: widget.isSwitched ? Colors.white : Colors.black,
                    highlightColor: Colors.blue[600],
                    child: Text(
                      'Nowa gra',
                      style: TextStyle(fontSize: 25.0, fontFamily: 'Quicksand'),
                    ),
                  )),
              UndoButton(widget.isSwitched, undoMove, winner),
            ],
          ),
        ]);
  }
}
