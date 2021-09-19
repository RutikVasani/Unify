import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tabs/Query/ask_query.dart';

class ListQueries extends StatefulWidget {
  ListQueries({Key? key}) : super(key: key);

  @override
  ListQueriesState createState() => ListQueriesState();
}

class ListQueriesState extends State<ListQueries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AskQuery())
              );
            }));
  }
}
