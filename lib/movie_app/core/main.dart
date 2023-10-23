import 'package:app/movie_app/core/mangerRoutes.dart';
import 'package:app/movie_app/core/theme/video_app_theme.dart';
import 'package:app/movie_app/featuers/pages/startup_pages/start1.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPoint());
}

class MainPoint extends StatelessWidget {
  const MainPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dark,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManger.generRoute,
      home: SafeArea(child: Start1()),
    );
  }
}
