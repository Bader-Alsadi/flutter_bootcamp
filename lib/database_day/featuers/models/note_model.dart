import 'package:flutter/material.dart';

class Note {
  int? id;
  late String title, descrption, date;
  int status = 0;
  Note(
      {required this.title,
      required this.descrption,
      required this.date,
      this.id = null});

  Note.fromJOSN(Map<String, dynamic> josn) {
    id = josn["id"];
    title = josn["title"];
    descrption = josn["descrption"];
    date = josn["date"];
    status = josn["status"];
  }

  Map<String, dynamic> toJOSN() {
    return {
      "title": this.title,
      "descrption": this.descrption,
      "date": this.date,
      "status": this.status,
      "id": this.id ?? null
    };
  }
}
