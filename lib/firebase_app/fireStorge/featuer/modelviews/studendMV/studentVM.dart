import 'package:app/firebase_app/fireStorge/featuer/model/student_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentVM with ChangeNotifier {
  List<Student> _allStudent = [];
  var objectF = FirebaseFirestore.instance;

  Future<List<Student>> faech() async {
    final result = await objectF.collection("studnet").get();
    _allStudent = result.docs.map((e) => Student.fromDoucSnap(e)).toList();
    return _allStudent;
  }

  Future<String> addStudent(Student student) async {
    var dou = await objectF.collection("studnet").add(student.toJson());
    student.id = dou.id;
    _allStudent.add(student);
    notifyListeners();
    return "done";

  
  }
}
