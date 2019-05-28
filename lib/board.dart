import 'package:flutter/material.dart';
import './square.dart';
import './WhoseTurn.dart';
import './winner.dart';

class Board extends StatefulWidget {
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int turn0 = 1, winner = 0;
  List<int> board = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  isRowEqual(a, b, c) {
    return board[a] == board[b] && board[a] == board[c] && board[a] != 0;
  }

  nextTurn(i) {
    if(winner==0){

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
      print(board);
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          winner != 0 ? Winner(winner) : WhoseTurn(turn0),
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
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child:
          RaisedButton(
            onPressed: (){
              setState(() {
                winner = 0;
                board.fillRange(0, 9, 0);
              });
            },
            color: Colors.red[300],
            padding: EdgeInsets.all(8.0),
            textColor: Colors.white,
            highlightColor: Colors.red,
            child: Text('Nowa gra', style: TextStyle(fontSize: 25.0, fontFamily: 'Quicksand'),),
          )
           ),
        ]);
  }
}

