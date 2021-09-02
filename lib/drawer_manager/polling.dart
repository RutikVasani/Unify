import 'package:flutter/material.dart';

class Polling extends StatelessWidget {
  const Polling({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
        "Polling",
        style: TextStyle(fontSize: 30),
    ),
      )
    );
  }
}