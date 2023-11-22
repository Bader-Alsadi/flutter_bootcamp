import 'dart:async';

import 'package:app/dya58_floor/DAOs/agrgation.dart';
import 'package:app/dya58_floor/DAOs/course_dao.dart';
import 'package:app/dya58_floor/DAOs/department_dao.dart';
import 'package:app/dya58_floor/DAOs/reg_course.dart';
import 'package:app/dya58_floor/DAOs/student_dao.dart';
import 'package:app/dya58_floor/entities/course.dart';
import 'package:app/dya58_floor/entities/department.dart';
import 'package:app/dya58_floor/entities/reg_course.dart';
import 'package:app/dya58_floor/entities/sudent.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_databas.g.dart';

@Database(version: 2, entities: [Student, Department, Course, RegCourse])
abstract class AppDatabase extends FloorDatabase {
  StudentDao get studentDao;
  DepartmentDao get departmentDao;
  CourseDao get courseDao;
  RegCourseDao get regCourseDao;
  Aggragtion get aggragtion;
}
