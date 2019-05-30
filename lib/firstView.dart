import 'package:flutter/material.dart';
import './circlePainter.dart';
import './crossPainter.dart';
import './main.dart';

class FirstView extends StatefulWidget {
  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  String firstPlayer = 'kółko', secondPlayer = 'krzyzyk';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Pierwszy gracz  '),
              CustomPaint(size: Size(25.0, 25.0), painter: CirclePainter(1, 5)),
            ],
          ),
          Container(
              margin: EdgeInsets.all(40.0),
              width: 300.0,
              child: TextField(
                onChanged: (String textinput) {
                  setState(() {
                    firstPlayer = textinput;
                  });
                },
                decoration: InputDecoration(hintText: 'Imię..'),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Drugi gracz  '),
              CustomPaint(size: Size(25.0, 25.0), painter: CrossPainter(1, 5)),
            ],
          ),
          Container(
              margin: EdgeInsets.all(40.0),
              width: 300.0,
              child: TextField(
                onChanged: (String textinput) {
                  setState(() {
                    secondPlayer = textinput;
                  });
                },
                decoration: InputDecoration(hintText: 'Imię..'),
              )),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.red[300],
              padding: EdgeInsets.only(
                  top: 8.0, right: 15.0, bottom: 8.0, left: 15.0),
              textColor: Colors.grey[100],
              highlightColor: Colors.red[400],
              child: Text(
                'Zacznij grę',
                style: TextStyle(fontSize: 25.0, fontFamily: 'Quicksand'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SecondRoute(firstPlayer, secondPlayer)),
                );
              },
            ),
          ),
        ]));
  }
}
