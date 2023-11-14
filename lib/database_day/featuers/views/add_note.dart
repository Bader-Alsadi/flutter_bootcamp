import 'package:app/database_day/featuers/models/note_model.dart';
import 'package:app/database_day/featuers/viewmodels/note_view_model.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  GlobalKey<FormState> key_f = GlobalKey();
  TextEditingController titleComtroller = TextEditingController();
  TextEditingController descrptionComtroller = TextEditingController();
  late DateTime noteDate;
  NoteViewModel noteViewModel = NoteViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                noteViewModel.addll();
              },
              child: Icon(Icons.add))
        ],
        title: Text("add new note"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String message = "";
          Note note = Note(
              title: titleComtroller.text,
              descrption: descrptionComtroller.text,
              date: noteDate.toString());
          print(noteDate.toString());
          int code = await noteViewModel.saveDate(note);
          if (code > 0)
            message = "done";
          else
            message = "not done";

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
          Navigator.pop(context);
        },
        child: Icon(Icons.add),
      ),
      body: Form(
        key: key_f,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: titleComtroller,
              ),
              TextFormField(
                controller: descrptionComtroller,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(noteDate.toString()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
