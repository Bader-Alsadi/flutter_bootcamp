import 'package:app/day38/fetuer/models/course.dart';

class CourseControler {
  List<Coures> _allcoures = [];
  addCoures({required Coures coures})
  {
    _allcoures.add(coures);
  }

  List<Coures> getCoures(){
    return _allcoures;
  }

  int getCredits(){
    return _allcoures.map((e) => e.credits).reduce((value, element) => value+element);
  }
}