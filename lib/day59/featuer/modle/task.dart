import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


part 'task.g.dart';

@HiveType(typeId: 2)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String? description;
  @HiveField(2) 
  bool state ;

Task({required this.title,this.description,required this.state});
}