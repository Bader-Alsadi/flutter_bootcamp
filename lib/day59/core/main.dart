import 'package:app/day59/featuer/modle/task.dart';
import 'package:app/day59/featuer/views/hive.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("tasks");
  Hive.registerAdapter(TaskAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: TaskH() ,
    );
  }
}