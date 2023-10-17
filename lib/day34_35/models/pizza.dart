import 'dart:ffi';

class Pizza {
  late String name, size;
  List<String> topping =[];
  late bool isgluttenFree;
 List <String>? SpecialInstructions;
  Pizza({required this.name,required this.size,required this.topping,required this.isgluttenFree,this.SpecialInstructions});
}
