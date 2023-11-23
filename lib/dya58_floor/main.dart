import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/course/show_course.dart';
import 'package:app/dya58_floor/views/dashborad.dart';
import 'package:app/dya58_floor/views/department/show_dapartment.dart';
import 'package:app/dya58_floor/views/student_pahe/student_show.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBhelper.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'Material App',
      routes: {
        "student": (context) => StudentShow(),
        "department": (context) => DepartmentShow(),
        "course": (context) => CourseShow(),
      },
      home: DashboardPage(),
    );
  }
}
