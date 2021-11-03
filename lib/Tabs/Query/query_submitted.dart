import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

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

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 11;
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Image.asset(
              "assets/images/querySubmitted.gif",
              alignment: Alignment.topCenter,
            ),
          ),
          Container(
            child: Text(
              'Your Query has been submitted !!!',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Container(
                child: Text(
                  'Exiting page in ...',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                  child: CountdownTimer(
                endTime: endTime,
              )),
            ],
          )
        ],
      ),
    );
  }
}
