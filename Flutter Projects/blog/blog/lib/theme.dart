import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool isdark = false;
  ThemeMode get currentTheme => isdark ? ThemeMode.dark : ThemeMode.light;
  void toogleTheme() {
    isdark = !isdark;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.montserrat(color: Colors.black38),
        hintStyle:GoogleFonts.montserrat(color: Colors.black38) ,
        focusedBorder: OutlineInputBorder(
 borderSide:const BorderSide(color: Color(0xff00b894)),
            borderRadius: BorderRadius.circular(5.0)
        ),
          border: OutlineInputBorder(
            borderSide:const BorderSide(color: Color(0xffdfe6e9)),
            borderRadius: BorderRadius.circular(5.0))),
      scaffoldBackgroundColor: const Color(0xffdfe6e9),
      primaryColor: const Color(0xff1abc9c),
      primaryColorLight: const Color(0xff16a085),
      appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.montserrat(),
          elevation: 0.0,
          backgroundColor: const Color(0xff1abc9c)),
      textTheme: TextTheme(
        headline1: GoogleFonts.montserrat(color: Colors.white),
        headline4: GoogleFonts.montserrat(color: Colors.white),
        headline5: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          color: const Color(0xff34495e)),
        headline6: GoogleFonts.montserrat(color: Colors.white,fontSize: 18.0),
        subtitle1: GoogleFonts.montserrat(
            textStyle:
                const TextStyle(color: Color(0xff34495e), fontSize: 16.0)),
        bodyText1: GoogleFonts.lato(
            textStyle: const TextStyle(color: Color(0xff636e72))),
        subtitle2: GoogleFonts.lato(
            textStyle: const TextStyle(color: Color(0xffbdc3c7))),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
