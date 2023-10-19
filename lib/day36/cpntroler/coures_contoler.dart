import 'package:app/day36/models/coures.dart';

class CouresContloer {

  
  List<Coures> _allCoures = [];
  List<Coures> get allCoures => _allCoures;

  void addCourse({required Coures coures}) {
    _allCoures.add(coures);
  }

  void removeCourse({required String nameCourse}) {
    int index = _allCoures.indexWhere((element) => element.name == nameCourse);
    if (index != -1)
      _allCoures.removeAt(index);
    else
      print(" not found");
  }

  void editCouresInfo(
      {required int index, required Coures coures}) {
    _allCoures[index].name = coures.name ;
    _allCoures[index].noHouers = coures.noHouers;
  }
}
