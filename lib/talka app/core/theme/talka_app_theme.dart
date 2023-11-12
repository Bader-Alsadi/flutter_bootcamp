import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //     backgroundColor: yellow, iconSize: 20, foregroundColor: white),
  fontFamily: "Montserrat",
  scaffoldBackgroundColor: primary,
  textTheme: TextTheme(
      titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          // textStyle: TextStyle(color: yellow),
          backgroundColor: orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ))),

  // appBarTheme: AppBarTheme(
  //     backgroundColor: white,
  //     titleTextStyle: TextStyle(color: black, fontSize: 20)),
);
