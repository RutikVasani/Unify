import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Tabs/chats.dart';
import 'package:flutter_application_1/Tabs/Query/ask_query.dart';
import 'package:flutter_application_1/drawer_manager/Syllabus.dart';
import 'package:flutter_application_1/drawer_manager/assignment.dart';
import 'package:flutter_application_1/drawer_manager/notice_board.dart';
import 'package:flutter_application_1/drawer_manager/polling.dart';
import 'package:flutter_application_1/drawer_manager/resume.dart';
import 'package:flutter_application_1/drawer_manager/setting.dart';
import 'package:flutter_application_1/pages/forgot_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/utils/themes.dart';

import 'Tabs/Query/query_sumitted.dart';
import 'Tabs/calender.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/spash",
      routes: {
        "/splash": (context) => SplashScreen(),
        MyRoutes.loginroutes: (context) => LoginPage(),
        MyRoutes.splashroutes: (context) => SplashScreen(),
        MyRoutes.forgotroutes: (context) => ForgotPassword(),
        MyRoutes.mainpageroutes: (context) => MainPage(),
        MyRoutes.assignmentroutes: (context) => Assignment(),
        MyRoutes.noticeboardroutes: (context) => NoticeBoard(),
        MyRoutes.pollingroutes: (context) => Polling(),
        MyRoutes.resumeroutes: (context) => Resume(),
        MyRoutes.settingroutes: (context) => Setting(),
        MyRoutes.syllabusroutes: (context) => Syllabus(),
        MyRoutes.chatroutes: (context) => Chats(),
        MyRoutes.calenderroutes: (context) => Calender(),
        MyRoutes.askqueryroutes: (context) => AskQuery(),
        MyRoutes.querySubmittedroutes: (context) => QuerySubmitted(),
      },
    );
  }
}
