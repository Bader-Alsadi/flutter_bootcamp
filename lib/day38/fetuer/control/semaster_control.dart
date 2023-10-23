import 'package:app/day38/fetuer/models/course.dart';
import 'package:app/day38/fetuer/models/semester.dart';

class SemasterControl {
  List<Semester> _allSemester = [];

  addSemasyer({required Semester semester}) {
    _allSemester.add(semester);
  }

  List<Semester> getsumaster() {
    return _allSemester;
  }

  addCoures({required Coures coures,required int id})
  {
    int index = _allSemester.indexWhere((element) => element.id==id);
    if(index!=0){
      _allSemester[index].semasterCourses.add(coures);
    }
  }

  
}
