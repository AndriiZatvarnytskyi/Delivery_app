import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xff2f1253),
      ),
      primaryColor: const Color(0xff7549d0),
      primaryColorDark: const Color(0xff2f1253),
      primaryColorLight: const Color(0xFF977BCE),
      scaffoldBackgroundColor: const Color(0xFFAB9ACC),
      backgroundColor: const Color(0xff88d9e6),
      fontFamily: 'Futura',
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 36),
        headline2: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 24),
        headline3: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 18),
        headline4: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 16),
        headline5: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 14),
        headline6: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.normal,
            fontSize: 14),
        bodyText1: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.normal,
            fontSize: 12),
        bodyText2: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.normal,
            fontSize: 10),
      ));
}
