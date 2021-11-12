import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.all(15.0),
          height: 61,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          color: Colors.grey)
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.face), onPressed: () {}),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Type Something...",
                              border: InputBorder.none),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.photo_camera),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.attach_file),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration:
                    BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                child: InkWell(
                  child: Icon(
                    Icons.keyboard_voice,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    setState(() {
                      // _showBottom = true;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_4.jpg"),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Charlotte",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
