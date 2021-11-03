import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tabs/Query/list_query.dart';
import 'package:flutter_application_1/Tabs/calander/calender.dart';
import 'package:flutter_application_1/Tabs/chat_screen.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxScrolled) => [
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                pinned: true,
                floating: true,
                snap: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ],
                title: Text(
                  "Unify",
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
                // backgroundColor: Colors.blue,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.indigo.shade800,
                    Colors.blue.shade500,
                  ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                ),
                bottom: TabBar(
                    indicatorColor: Colors.blue.shade300,
                    indicatorWeight: 5,
                    tabs: [
                      Tab(text: 'CHATS'),
                      Tab(text: 'CALENDER'),
                      Tab(text: 'QUERY')
                    ]),
                titleSpacing: 0,
                elevation: 5,
              ),
            ],
            body: TabBarView(children: [
              ChatScreen(),
              Calendar(),
              ListQueries(),
            ]),
          ),
          drawer: MyDrawer(),
        ),
      );
}

Widget buildPage(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
    );
