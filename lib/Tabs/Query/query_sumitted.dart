import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/main_page.dart';

class QuerySubmitted extends StatefulWidget {
  QuerySubmitted({Key? key}) : super(key: key);

  @override
  _QuerySubmittedState createState() => _QuerySubmittedState();
}

class _QuerySubmittedState extends State<QuerySubmitted> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: Center(
        child: Container(
          child: Text('Your Query has been submitted'),
        ),
      ),
    );
  }
}
