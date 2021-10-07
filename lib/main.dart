import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tabs/Query/query_submitted.dart';
import 'package:flutter_application_1/Tabs/chats.dart';
import 'package:flutter_application_1/Tabs/Query/ask_query.dart';
import 'package:flutter_application_1/drawer_manager/Syllabus.dart';
import 'package:flutter_application_1/drawer_manager/assignment.dart';
import 'package:flutter_application_1/drawer_manager/notice_board.dart';
import 'package:flutter_application_1/drawer_manager/polling.dart';
import 'package:flutter_application_1/drawer_manager/resume.dart';
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
import 'Tabs/calender.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

final databaseRef = FirebaseDatabase.instance.reference();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        // initialRoute: MyRoutes.splashroutes,
        initialRoute: MyRoutes.loginroutes,
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
          MyRoutes.userProfileroutes: (context) => UserProfile(),
          MyRoutes.roughPageroutes: (context) => RoughPage(),
          MyRoutes.roughLoginroutes: (context) => RLoginPage(),
          MyRoutes.roughPage3routes: (context) => HomePage(),
        },
      );
}
