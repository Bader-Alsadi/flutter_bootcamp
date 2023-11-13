import 'package:app/database_day/featuers/views/show_notes.dart';
import 'package:app/day53/featuer/views/sql_lite_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(muApp());
}

class muApp extends StatelessWidget {
  const muApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home:SqlLitPage() ,);
  }
}