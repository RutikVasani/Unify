import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/themes.dart';
import 'package:polls/polls.dart';

class Polling extends StatefulWidget {
  @override
  _PollingState createState() => _PollingState();
}

class _PollingState extends State<Polling> {
  double option1 = 1.0;
  double option2 = 0.0;
  double option3 = 1.0;
  double option4 = 1.0;
  double option5 = 1.0;
  double option6 = 3.0;
  double option7 = 2.0;
  double option8 = 1.0;

  String user = "king@mail.com";
  Map usersWhoVoted = {
    'sam@mail.com': 3,
    'mike@mail.com': 4,
    'john@mail.com': 1,
    'kenny@mail.com': 1
  };
  String creator = "eddy@mail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFFFBFB),
                      Color(0xffEEEEEE),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                  child: Container(
                    child: Polls(
                      children: [
                        // This cannot be less than 2, else will throw an exception
                        Polls.options(title: 'Cairo', value: option1),
                        Polls.options(title: 'Mecca', value: option2),
                        Polls.options(title: 'Denmark', value: option3),
                        Polls.options(title: 'Mogadishu', value: option4),
                        Polls.options(title: 'Maldives', value: option5),
                        Polls.options(title: 'Brazil', value: option6),
                        Polls.options(title: 'Ethiopia', value: option7),
                        Polls.options(title: 'Italy', value: option8),
                      ],
                      question: Text(
                        'Which country do you live?',
                        style: TextStyle(fontSize: 20),
                      ),
                      currentUser: this.user,
                      creatorID: this.creator,
                      voteData: usersWhoVoted,
                      userChoice: usersWhoVoted[this.user],
                      onVoteBackgroundColor: Colors.blue,
                      leadingBackgroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      onVote: (choice) {
                        print(choice);
                        setState(() {
                          this.usersWhoVoted[this.user] = choice;
                        });
                        if (choice == 1) {
                          setState(() {
                            option1 += 1.0;
                          });
                        }
                        if (choice == 2) {
                          setState(() {
                            option2 += 1.0;
                          });
                        }
                        if (choice == 3) {
                          setState(() {
                            option3 += 1.0;
                          });
                        }
                        if (choice == 4) {
                          setState(() {
                            option4 += 1.0;
                          });
                        }
                        if (choice == 5) {
                          setState(() {
                            option5 += 1.0;
                          });
                        }
                        if (choice == 6) {
                          setState(() {
                            option6 += 1.0;
                          });
                        }
                        if (choice == 7) {
                          setState(() {
                            option7 += 1.0;
                          });
                        }
                        if (choice == 8) {
                          setState(() {
                            option8 += 1.0;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                  vertical: 30,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/btn_back.png',
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      ' Polls',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
