import 'package:flutter/material.dart';
import './board.dart';
import './firstView.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 25.0),
        ),
      ),
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstView(),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final String firstPlayer, secondPlayer;
  SecondRoute(this.firstPlayer, this.secondPlayer);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Board(firstPlayer, secondPlayer),
    );
  }
}
