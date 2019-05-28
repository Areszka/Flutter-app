import 'package:flutter/material.dart';
import './board.dart';

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
      home: Scaffold(
        body: Board(),
    ));
  }
}
