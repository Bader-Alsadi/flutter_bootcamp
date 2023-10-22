import 'package:app/day38/fetuer/models/semester.dart';

class SemasterControl {
  List<Semester> _allSemester = [];

  addSemasyer({required Semester semester}) {
    _allSemester.add(semester);
  }

  List<Semester> getsumaster() {
    return _allSemester;
  }
}
