import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(
                  "Rutik",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                accountEmail: Text(
                  "rutikvasani370@gmail.com",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () =>
                  Navigator.pushNamed(context, MyRoutes.mainpageroutes),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.news,
                color: Colors.white,
              ),
              title: Text("Notice board",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () =>
                  Navigator.pushNamed(context, MyRoutes.noticeboardroutes),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.number,
                color: Colors.white,
              ),
              title: Text("Assignment",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () =>
                  Navigator.pushNamed(context, MyRoutes.assignmentroutes),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.paperplane,
                color: Colors.white,
              ),
              title: Text("polling",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () => Navigator.pushNamed(context, MyRoutes.pollingroutes),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.drop,
                color: Colors.white,
              ),
              title: Text("Sylleabus",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () =>
                  Navigator.pushNamed(context, MyRoutes.sylleabusroutes),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.play_rectangle_fill,
                color: Colors.white,
              ),
              title: Text("Resume",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () => Navigator.pushNamed(context, MyRoutes.resumeroutes),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text("Setting",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () => Navigator.pushNamed(context, MyRoutes.settingroutes),
            ),
          ],
        ),
      ),
    );
  }
}
