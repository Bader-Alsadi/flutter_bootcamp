import 'package:app/firebase_app/note_app/core/constan/note_state_enum.dart';
import 'package:firebase_core/firebase_core.dart';

class Note {
  late int id;
  late String title;
  late String description;
  late NoteStats noteStats;

  Note(
      {required this.id,
      required this.title,
      required this.description,
      required this.noteStats});

  Map<String, dynamic> toJosn() {
    return {
      "id": this.id,
      "title": this.title,
      "description": this.description,
      "state": this.noteStats
    };
  }
}
