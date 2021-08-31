import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Text(
        "main page",
        style: TextStyle(color: Colors.black, fontSize: 30),
      )),
    );
  }
}
