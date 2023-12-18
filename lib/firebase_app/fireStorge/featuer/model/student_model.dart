
import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String? id;
  String? name;
  String? email;
  String? passwword;

  Student({this.name, this.email, this.passwword});

  Student.fromJson(Map<String, dynamic> json) {
    print(json);
    name = json['name'];
    email = json['email'];
    passwword = json['passwor'];
  }

  Student.fromDoucSnap(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> json = documentSnapshot.data() as Map<String, dynamic>;
    print(json);
    id = documentSnapshot.id;
    name = json['name'];
    email = json['email'];
    passwword = json['passwor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['passwor'] = this.passwword;
    return data;
  }
}
