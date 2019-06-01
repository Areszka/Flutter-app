import 'package:flutter/material.dart';
import './board.dart';
import './firstView.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool themeDark = false;
  changeTheme() {
    setState(() {
      themeDark = !themeDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: themeDark ? Brightness.dark : Brightness.light,
          fontFamily: 'Quicksand',
          textTheme: TextTheme(
            body1: TextStyle(fontSize: 25.0),
          ),
        ),
        home: FirstRoute(changeTheme));
  }
}

class FirstRoute extends StatelessWidget {
  final Function changeTheme;

  FirstRoute(this.changeTheme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstView(changeTheme),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final String firstPlayer, secondPlayer;
  final bool isSwitched;
  SecondRoute(this.firstPlayer, this.secondPlayer, this.isSwitched);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Board(firstPlayer, secondPlayer, this.isSwitched),
    );
  }
}
