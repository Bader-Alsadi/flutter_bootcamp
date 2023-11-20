import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:flutter/material.dart';

//colors
const Color primary = Color(0xffC0C0C0);
const Color secondry = Color(0xff000080);
const Color black = Color(0xff000000);
const Color white = Color(0xffFFFFFF);

//padding

const double spacer = 50;
const double smallPadding = 30;
const double minPadding = 10;

//radio

const double radio = 10;

ThemeData themeData = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      elevation: 0,
      titleTextStyle: title,
    ),
    scaffoldBackgroundColor: white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: secondry)));
