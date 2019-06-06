import 'package:flutter/material.dart';
import './circlePainter.dart';
import './crossPainter.dart';
import './main.dart';

class FirstView extends StatefulWidget {
  final Function changeTheme;
  FirstView(this.changeTheme);
  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  String firstPlayer = 'kółko', secondPlayer = 'krzyzyk';
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
        top: 20,
        right: 20,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.brightness_3,
              color: isSwitched ? Colors.grey[800] : Colors.grey,
            ),
            Switch(
                activeColor: Colors.blue,
                activeTrackColor: Colors.blue[100],
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    widget.changeTheme();
                  });
                }),
            Icon(
              Icons.brightness_5,
              color: isSwitched ? Colors.grey[800] : Colors.grey,
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 100,
          child: Column(children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Pierwszy gracz  '),
                CustomPaint(
                    size: Size(25.0, 25.0), painter: CirclePainter(1, 5)),
              ],
            ),
            Container(
                margin: EdgeInsets.all(40.0),
                width: 300.0,
                child: TextField(
                  decoration: InputDecoration(hintText: 'Imię..'),
                  onChanged: (String textinput) {
                    setState(() {
                      firstPlayer = textinput;
                    });
                  },
                )),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Drugi gracz  '),
                CustomPaint(
                    size: Size(25.0, 25.0), painter: CrossPainter(1, 5)),
              ],
            ),
            Container(
                margin: EdgeInsets.all(40.0),
                width: 300.0,
                child: TextField(
                  decoration: InputDecoration(hintText: 'Imię..'),
                  onChanged: (String textinput) {
                    setState(() {
                      secondPlayer = textinput;
                    });
                  },
                )),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                color: Colors.blue[500],
                padding: EdgeInsets.only(
                    top: 8.0, right: 15.0, bottom: 8.0, left: 15.0),
                textColor: isSwitched ? Colors.white : Colors.black,
                highlightColor: Colors.blue[600],
                child: Text(
                  'Zacznij grę',
                  style: TextStyle(fontSize: 25.0, fontFamily: 'Quicksand'),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondRoute(firstPlayer, secondPlayer, isSwitched)),
                  );
                },
              ),
            ),
          ]))
    ]);
  }
}
