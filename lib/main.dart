import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/forgot_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/utils/themes.dart';

void main() {
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
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        MyRoutes.loginroutes: (context) => LoginPage(),
        MyRoutes.splashroutes: (context) => SplashScreen(),
        MyRoutes.forgotroutes: (context) => ForgotPassword(),
        MyRoutes.mainpageroutes: (context) => MainPage(),
      },
    );
  }
}
