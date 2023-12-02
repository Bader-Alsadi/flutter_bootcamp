import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:flutter/material.dart';

ThemeData ligth = ThemeData(
  fontFamily: "Montserrat",
  appBarTheme: AppBarTheme(
    color: white,
    titleTextStyle: title,
    
    elevation: 0,
  ),
  scaffoldBackgroundColor: white,
  listTileTheme: ListTileThemeData(
    titleTextStyle: title,
    contentPadding: EdgeInsets.symmetric(horizontal: HE_paddding),
  ),
);
