// ignore_for_file: unused_import

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tabs/Query/ask_query.dart';
import 'package:flutter_application_1/Tabs/Query/editQuery.dart';
import 'package:flutter_application_1/pages/roughpage.dart';
import 'package:intl/intl.dart';

class ListQueries extends StatefulWidget {
  @override
  _ListQueriesState createState() => _ListQueriesState();
}

class _ListQueriesState extends State<ListQueries> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('queries');

  final user = FirebaseAuth.instance.currentUser;

  List<Color?> myColors = [
    Colors.yellow[200],
    Colors.red[200],
    Colors.green[200],
    Colors.deepPurple[200],
    Colors.purple[200],
    Colors.cyan[200],
    Colors.teal[200],
    Colors.tealAccent[200],
    Colors.pink[200],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => AskQuery(),
            ),
          )
              .then((value) {
            print("Calling Set  State !");
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.yellow[300],
      ),
      //
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.blue[400],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<QuerySnapshot>(
              future: ref.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.length == 0) {
                    return Center(
                      child: Text(
                        "You have no saved Notes !",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Random random = new Random();
                      Color? bg = myColors[random.nextInt(4)];
                      Map? data = snapshot.data!.docs[index].data() as Map?;
                      // DateTime mydateTime = data!['created'].toDate();
                      // String formattedTime =
                      //     DateFormat.yMMMd().add_jm().format(mydateTime);
                      Timestamp t = data!['created'];
                      DateTime now = t.toDate();
                      String formattedTime =
                          DateFormat('kk:mm:ss \nEEE d MMM').format(now);

                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => ViewQuery(
                                data,
                                formattedTime,
                                snapshot.data!.docs[index].reference,
                              ),
                            ),
                          )
                              .then((value) {
                            setState(() {});
                          });
                        },
                        child: Container(
                          height: 140,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Card(
                              color: bg,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${data['title']}",
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontFamily: "lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //
                                    Row(
                                      children: [
                                        Expanded(
                                          // alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${data['studentId']} \n${user!.email}",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "lato",
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            formattedTime,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "lato",
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("Loading..."),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
