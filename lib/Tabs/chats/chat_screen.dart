import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/chat_outline.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Material(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlineItem(
                        imageUrl: 'assets/images/user_4.jpg',
                        name: 'Charlotte',
                        code: 'hiii',
                        time: '3.19 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_2.jpg',
                        name: 'Noah',
                        code: 'hello',
                        time: '3.19 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_5.jpg',
                        name: 'Oliver',
                        code: 'byyy',
                        time: '3.19 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user.jpg',
                        name: 'Emma',
                        code: 'typing...',
                        time: '3.19 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_2.jpg',
                        name: 'Alis',
                        code: 'Enjoy',
                        time: '3.19 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_4.jpg',
                        name: 'Charlotte',
                        code: 'hiii',
                        time: '3.19 pm',
                      ),
                      OutlineItem(
                        imageUrl: 'assets/images/user_5.jpg',
                        name: 'Michal',
                        code: 'Good Morning',
                        time: '3.19 pm',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
