import 'package:flutter/material.dart';

class ThemeService {
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: Color(0xFF5d6475),
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Montserrat',
      dividerTheme: DividerThemeData(
        color: Colors.white,
        thickness: 0.3,
      ),
      dialogBackgroundColor: Color(0xFF5d6475),
      textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.white),
          bodyText2: TextStyle(fontSize: 18.0, color: Colors.white),
          subtitle2: TextStyle(fontSize: 16.0, color: Colors.white),
          headline5: TextStyle(fontSize: 14.0, color: Colors.white),
          headline6: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
          subtitle1: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
          headline4: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w700,
              color: Colors.white)),
    );
  }
}
