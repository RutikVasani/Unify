import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/google_sign_in.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.red.shade300),
                  accountName: Text(user.displayName!),
                  accountEmail: Text(user.email!),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!)),
                )),
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
              title: Text("Notice Board",
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
                CupertinoIcons.hand_raised_fill,
                color: Colors.white,
              ),
              title: Text("Polling",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () => Navigator.pushNamed(context, MyRoutes.pollingroutes),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.book_fill,
                color: Colors.white,
              ),
              title: Text("Syllabus",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () =>
                  Navigator.pushNamed(context, MyRoutes.syllabusroutes),
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
              title: Text("Settings",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () => Navigator.pushNamed(context, MyRoutes.settingroutes),
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.zoom_out,
                  color: Colors.white,
                ),
                title: Text("Logout",
                    textScaleFactor: 1.4,
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                }),
          ],
        ),
      ),
    );
  }
}
