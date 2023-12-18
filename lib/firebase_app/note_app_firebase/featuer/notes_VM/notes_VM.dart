import 'package:app/firebase_app/note_app_firebase/core/constan/note_state_enum.dart';
import 'package:app/firebase_app/note_app_firebase/featuer/model/note_modle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteVM with ChangeNotifier {
  var objectF = FirebaseFirestore.instance;
  String message = "no thing";

  List<Note> _allnote = [];
  Future<String> addNote(Note note) async {
    await objectF.collection("notes").add(note.toJson()).then((value) {
      note.id = value.id;
      _allnote.add(note);
      notifyListeners();
      message = "done";
    }).catchError((e) {
      message = "not done becous : $e";
    });

    return message;
  }

  Future<List<Note>> getAllNote() async {
    final result = await objectF.collection("notes").get();
    _allnote = result.docs.map((e) => Note.fromDoucSnap(e)).toList();

    return this._allnote;
  }

  Future<String> editNote(
      int index, String id, String title, String description) async {
    await objectF
        .collection("notes")
        .doc(id)
        .update({"title": title, "description": description}).then((value) {
      _allnote[index].title = title;
      _allnote[index].description = description;
      notifyListeners();
      message = "update seccssfuly";
    }).catchError((e) {
      message = "fiald to update becouse : $e";
    });

    return message;
  }

  Future<String> deletNote(String id, int index) async {
    String message = "no thing";

    await objectF.collection("notes").doc(id).delete().then((value) {
      message = "delete seccssfuly";
      _allnote.removeAt(index);
      notifyListeners();
    }).catchError((e) {
      message = "fiald to delete becouse : $e";
    });
    return message;
  }

  changeNoteState(int index, String id, Status noteStats) async {
    await objectF.collection("notes").doc(id).update({
      "state": noteStats.value,
    }).then((value) {
      _allnote[index].noteStats = noteStats;
      notifyListeners();
      message = "update state seccssfuly";
    }).catchError((e) {
      message = "fiald to update state becouse : $e";
    });

    return message;
  }
}
