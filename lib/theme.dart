import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultTheme = ThemeData.light().copyWith(
    colorScheme: ThemeData.light().colorScheme.copyWith(
          brightness: Brightness.light,
          primary: defaultColor.shade500,
        ),
    textTheme: defaultText);

TextTheme defaultText = GoogleFonts.latoTextTheme().copyWith(
  body1: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: Colors.black),
  button: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  ),
  caption: TextStyle(
      fontSize: 8,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      color: Color(0xff606060)),
  display1: TextStyle(
    fontSize: 36,
    color: Colors.black,
  ),
  headline: TextStyle(
    color: Colors.black,
    fontSize: 16,
  ),
  title: TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
);

MaterialColor defaultColor = MaterialColor(0xFF158A9A, color);
Map<int, Color> color = {
  100: Color(0xFFC4E7EB),
  200: Color(0xFFC4E7EB),
  300: Color(0xFFC4E7EB),
  400: Color(0xFFC4E7EB),
  500: Color(0xFF158A9A),
  600: Color(0xFF158A9A),
  700: Color(0xFF158A9A),
  800: Color(0xFF158A9A),
  900: Color(0xFF158A9A),
};
