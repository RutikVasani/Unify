import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  const Resume({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
        "Resume",
        style: TextStyle(fontSize: 30),
    ),
      )
    );
  }
}