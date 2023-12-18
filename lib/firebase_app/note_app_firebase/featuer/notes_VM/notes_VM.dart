import 'package:app/firebase_app/note_app/core/constan/note_state_enum.dart';
import 'package:app/firebase_app/note_app_firebase/core/constan/note_state_enum.dart';
import 'package:app/firebase_app/note_app_firebase/featuer/model/note_modle.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteVM with ChangeNotifier {
  var objectF = FirebaseFirestore.instance;

  List<Note> _allnote = [];
  addNote(Note note) async {
    var dou = await objectF.collection("notes").add(note.toJson());
    note.id = dou.id;
    print(_allnote);
    _allnote.add(note);
    notifyListeners();
    return "done";
  }

  Future<List<Note>> getAllNote() async {
    final result = await objectF.collection("notes").get();
    _allnote = result.docs.map((e) => Note.fromDoucSnap(e)).toList();

    return this._allnote;
  }

  Future<bool> editNote(
      int index, String id, String title, String description) async {
    final result = await objectF
        .collection("notes")
        .doc(id)
        .update({"title": title, "description": description});

    _allnote[index].title = title;
    _allnote[index].description = description;
    notifyListeners();
    return true;
  }

  Future<bool> deletNote(String id, int index) async {
    var dou = await objectF.collection("notes").doc(id).delete();
    _allnote.removeAt(index);

    notifyListeners();
    return true;
  }

  changeNoteState(int index, String id, Status noteStats) async {
    final result = await objectF.collection("notes").doc(id).update({
      "state": noteStats.value,
    });

    _allnote[index].noteStats = noteStats;
    notifyListeners();
  }
}
