// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tabs/Query/ask_query.dart';
import 'package:flutter_application_1/Tabs/Query/list_query.dart';
import 'package:flutter_application_1/Tabs/Query/query_submitted.dart';
import 'package:flutter_application_1/Tabs/chats/chat_screen.dart';
import 'package:flutter_application_1/drawer_manager/Syllabus.dart';
import 'package:flutter_application_1/drawer_manager/assignment.dart';
import 'package:flutter_application_1/drawer_manager/notice_board.dart';
import 'package:flutter_application_1/drawer_manager/polling.dart';
import 'package:flutter_application_1/drawer_manager/setting.dart';
import 'package:flutter_application_1/drawer_manager/userprofile.dart';
import 'package:flutter_application_1/pages/forgot_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_application_1/pages/rough3.dart';
import 'package:flutter_application_1/pages/roughLogin.dart';
import 'package:flutter_application_1/pages/roughpage.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'Tabs/calander/calender.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        initialRoute: MyRoutes.splashroutes,
        home: Calendar(),
        routes: {
          "/splash": (context) => SplashScreen(),
          MyRoutes.loginroutes: (context) => LoginPage(),
          MyRoutes.splashroutes: (context) => SplashScreen(),
          MyRoutes.forgotroutes: (context) => ForgotPassword(),
          MyRoutes.mainpageroutes: (context) => MainPage(),
          MyRoutes.assignmentroutes: (context) => Assignment(),
          MyRoutes.noticeboardroutes: (context) => NoticeBoard(),
          MyRoutes.pollingroutes: (context) => Polling(),
          MyRoutes.settingroutes: (context) => Setting(),
          MyRoutes.syllabusroutes: (context) => Syllabus(),
          MyRoutes.chatroutes: (context) => ChatScreen(),
          MyRoutes.calendarroutes: (context) => Calendar(),
          MyRoutes.askqueryroutes: (context) => AskQuery(),
          MyRoutes.listqueryroutes: (context) => ListQueries(),
          MyRoutes.querySubmittedroutes: (context) => QuerySubmitted(),
          MyRoutes.userProfileroutes: (context) => UserProfile(),
          MyRoutes.roughLoginroutes: (context) => RLoginPage(),
          MyRoutes.roughPage3routes: (context) => HomePage(),
        },
      );
}
