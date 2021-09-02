import 'package:flutter/material.dart';

class Assignment extends StatelessWidget {
  const Assignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        "Assignment",
        style: TextStyle(fontSize: 30),
      ),
    ));
  }
}
