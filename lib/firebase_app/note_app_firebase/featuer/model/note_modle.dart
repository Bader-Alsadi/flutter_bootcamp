import 'package:app/firebase_app/note_app_firebase/core/constan/note_state_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Note {
  String? id;
  String? title;
  String? description;
  Status? noteStats;

  Note({this.title, this.description, this.noteStats});

  Note.fromDoucSnap(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> json = documentSnapshot.data() as Map<String, dynamic>;

    id = documentSnapshot.id;
    title = json['title'];
    description = json['description'];
    noteStats = Status.values
        .firstWhere((element) => element.value.contains(json['state']));
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "description": this.description,
      "state": "${this.noteStats!.value}"
    };
  }

  Status getstat(String value) {
    Status? status;
    Status.values.forEach((element) {
      if (value.contains(element.value)) {
        status = element;
      }
    });
    print("stay ${status}");
    return status!;
  }
}
