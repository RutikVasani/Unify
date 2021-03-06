import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

// class MyTheme {
//   static ThemeData lightTheme(BuildContext context) => ThemeData(
//       primarySwatch: Colors.blue,
//       fontFamily: GoogleFonts.lato().fontFamily,
//       appBarTheme: AppBarTheme(
//         color: Colors.white,
//         elevation: 0.0,
//         iconTheme: IconThemeData(color: Colors.white),
//         titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
//       ));

//   static ThemeData darkTheme(BuildContext context) =>
//       ThemeData(brightness: Brightness.dark);
// }

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: Colors.blue,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: Colors.blue),
      showUnselectedLabels: true,
    ),
  );
}

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

Color purpleColor = Color(0xff5843BE);
Color orangeColor = Color(0xffFF9376);
Color blackColor = Color(0xff000000);
Color whiteColor = Color(0xffFFFFFF);
Color greyColor = Color(0xff82868E);
Color softpurpleColor = Color(0xff9FAEFB);

double edge = 24;

TextStyle regularTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  color: blackColor,
);

TextStyle orangeTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  color: orangeColor,
);

TextStyle softpurpleColorTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  color: softpurpleColor,
);

TextStyle blackTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w300,
  color: greyColor,
);

TextStyle purpleTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  color: purpleColor,
);
