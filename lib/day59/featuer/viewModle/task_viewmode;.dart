import 'package:app/day59/core/helper/hiveHleper.dart';
import 'package:app/day59/featuer/modle/task.dart';
import 'package:floor/floor.dart';
import 'package:hive/hive.dart';

class TaslVM{

List<Task> alltask = [];
List<Task> fetch (){
  HiveHelper hh = HiveHelper("tasks");

  alltask = hh.feach().map<Task>((e) => e).toList();
  return alltask;
  
}

addTask( HiveObject hiveObject){
  HiveHelper hh = HiveHelper("tasks");
  hh.Store(hiveObject);
} 

UpdateTask(HiveObject hiveObject){
hiveObject.save();


}


}