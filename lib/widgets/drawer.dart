import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://w7.pngwing.com/pngs/971/990/png-transparent-computer-icons-login-person-user-pessoa-smiley-desktop-wallpaper-address-icon.png";
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: Text("${user!.displayName}"),
                    accountEmail: Text("${user!.email}"),
                    currentAccountPicture:
                        CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                    onDetailsPressed: () => Navigator.pushNamed(
                        context, MyRoutes.userProfileroutes)),
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
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.news_solid,
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
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.pollingroutes),
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
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.resumeroutes),
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
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.settingroutes),
              ),
              ListTile(
                  leading: Icon(
                    CupertinoIcons.lock_open_fill,
                    color: Colors.white,
                  ),
                  title: Text("Logout",
                      textScaleFactor: 1.4,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.loginroutes);
                    _signingOut();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _signingOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
