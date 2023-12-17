import 'package:app/firebase_app/note_app/core/constan/note_state_enum.dart';
import 'package:app/firebase_app/note_app/featuer/model/note_modle.dart';
import 'package:flutter/material.dart';

class NoteVM with ChangeNotifier {
  List<Note> _allnote = [];
  addNote(Note note) {
    _allnote.add(note);
    notifyListeners();
  }

  List<Note> getAllNote() {
    return this._allnote;
  }

  bool editNote(int id, String title, String description) {
    int index = _allnote.indexWhere((element) => element.id == id);
    if (index == null) {
      print(" fa : $index");
      return false;
    } else {
      print(" tr : $index");

      _allnote[index].title = title;
      _allnote[index].description = description;
      notifyListeners();
      return true;
    }
  }

  bool deletNote(int id) {
    int index = _allnote.indexWhere((element) => element.id == id);
    if (index == null) {
      print(" fa : $index");
      return false;
    } else {
      print(" tr : $index");
      _allnote.removeAt(index);

      notifyListeners();
      return true;
    }
  }

  changeNoteState(int id, NoteStats noteStats) {
    int index = _allnote.indexWhere((element) => element.id == id);
    if (index != null) {
      _allnote[index].noteStats = noteStats;
      notifyListeners();
    }
  }
}
