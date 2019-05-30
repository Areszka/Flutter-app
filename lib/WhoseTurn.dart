import 'package:flutter/material.dart';

import './circlePainter.dart';
import './crossPainter.dart';

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
            Text(
              'Teraz jest runda  ',
              style: Theme.of(context).textTheme.body1,
            ),
            CustomPaint(
              size: Size(25.0, 25.0),
              painter:
                  widget.turn0 == 1 ? CirclePainter(1, 5) : CrossPainter(1, 5),
            )
          ],
        ));
  }
}
