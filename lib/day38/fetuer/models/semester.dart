import 'package:app/day38/fetuer/models/course.dart';

class Semester {
  late int id;
  late String name, year;
  late List<Coures> semasterCourses = [];

  Semester({required this.name, required this.year,required this.id}) ;
}
