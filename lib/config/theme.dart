import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 206, 167, 62)))),
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 95, 72, 7),
      ),
      primaryColor: const Color(0xFFCEA73E),
      primaryColorDark: const Color.fromARGB(255, 206, 167, 62),
      primaryColorLight: const Color.fromRGBO(255, 206, 167, 62),
      scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 243, 243, 243)),
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
