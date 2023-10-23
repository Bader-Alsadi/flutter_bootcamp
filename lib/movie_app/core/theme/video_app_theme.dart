import 'package:app/movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: yellow, iconSize: 20, foregroundColor: white),
  brightness: Brightness.dark,
  textTheme: TextTheme(
      titleMedium: TextStyle(
    fontSize: 20,
    color: yellow,
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          // textStyle: TextStyle(color: yellow),
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ))),
  appBarTheme: AppBarTheme(
      backgroundColor: white,
      titleTextStyle: TextStyle(color: black, fontSize: 20)),
);
