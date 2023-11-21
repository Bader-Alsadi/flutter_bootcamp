import 'package:hive/hive.dart';

class HiveHelper{

late Box box;
HiveHelper(String boxName){
  box=Hive.box(boxName);
}
  Store(HiveObject hiveObject){
  

   box.add(hiveObject);
  }
}