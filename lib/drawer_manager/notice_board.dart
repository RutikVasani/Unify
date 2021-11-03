import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/outlinenoticeboard.dart';
import 'package:flutter_application_1/utils/themes.dart';

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  bool isClicked = false;
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Material(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlineItem(
                                imageUrl: 'assets/images/diwali.jpg',
                                name: 'Vacation',
                                topic: 'About Diwali vacation',
                              ),
                              OutlineItem(
                                imageUrl: 'assets/images/chess.png',
                                name: 'Compitition',
                                topic: 'About Chess Compitition',
                              ),
                              OutlineItem(
                                imageUrl: 'assets/images/exam1.jpg',
                                name: 'Exam',
                                topic: 'Abou Exam',
                              ),
                              OutlineItem(
                                imageUrl: 'assets/images/result.png',
                                name: 'Result',
                                topic: 'About Result',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      ' NoticeBoard',
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
