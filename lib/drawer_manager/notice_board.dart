import 'package:flutter/material.dart';

class NoticeBoard extends StatelessWidget {
  const NoticeBoard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
      child: Text(
        "Notice Board",
        style: TextStyle(fontSize: 30),
      ),
    )
    );
  }
}