import 'package:app/firebase_app/note_app_firebase/core/constan/note_state_enum.dart';
import 'package:app/firebase_app/note_app_firebase/featuer/model/note_modle.dart';
import 'package:app/firebase_app/note_app_firebase/featuer/notes_VM/notes_VM.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  Status? statu = Status.get_stared;

  @override
  Widget build(BuildContext context) {
    var nvm = Provider.of<NoteVM>(context);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          title.clear();
          description.clear();
          newMethod(context, nvm);
        },
        child: Icon(Icons.add_comment_outlined),
      ),
      body: FutureBuilder(
          future: nvm.getAllNote(),
          builder: (context, snapshot) {
            if (!(snapshot.connectionState == ConnectionState.done)) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text("no data yet"),
                );
              } else {
                List<Note> notes = snapshot.data!;
                return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) => ListTile(
                          trailing: Column(
                            children: [
                              Expanded(
                                child: Chip(
                                    label: Text(
                                        "${notes[index].noteStats!.value}")),
                              ),
                              Flexible(
                                child: Visibility(
                                    visible:
                                        notes[index].noteStats != Status.done,
                                    child: PopupMenuButton(
                                        icon: Icon(Icons.settings),
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                child: Text("update state"),
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                            title: Text(
                                                                "update state"),
                                                            content: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: Status
                                                                    .values
                                                                    .map((e) => RadioListTile(
                                                                        title: Text(e.value),
                                                                        value: e,
                                                                        groupValue: notes[index].noteStats,
                                                                        onChanged: e.index <= notes[index].noteStats!.index
                                                                            ? null
                                                                            : (value) async {
                                                                                notes[index].noteStats = value! as Status;
                                                                                var result = await nvm.changeNoteState(index, notes[index].id!, notes[index].noteStats!);
                                                                                showSnackBar(context, result);
                                                                                Navigator.pop(context);
                                                                              }))
                                                                    .toList()),
                                                          ));
                                                },
                                              ),
                                              PopupMenuItem(
                                                child: Text("eidt"),
                                                onTap: () {
                                                  title.text =
                                                      notes[index].title!;
                                                  description.text =
                                                      notes[index].description!;
                                                  newMethod(context, nvm,
                                                      index: index,
                                                      id: notes[index].id!);
                                                },
                                              ),
                                              PopupMenuItem(
                                                child: Text("delete"),
                                                onTap: () async {
                                                  var result =
                                                      await nvm.deletNote(
                                                          notes[index].id!,
                                                          index);
                                                  showSnackBar(context, result);
                                                },
                                              ),
                                            ])),
                              ),
                            ],
                          ),
                          title: Text(notes[index].title!),
                          subtitle: Text(notes[index].description!),
                        ));
              }
            }
          }),
    );
  }

  PersistentBottomSheetController<dynamic> newMethod(
      BuildContext context, NoteVM noVM,
      {String? id, int? index}) {
    return showBottomSheet(
        context: context,
        builder: (context) => Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Customfiled(
                    controller: title,
                    lable: "note title",
                  ),
                  Customfiled(
                    controller: description,
                    lable: "note description",
                  ),
                  id == null
                      ? DropdownButtonFormField(
                          value: Status.get_stared,
                          onChanged: (value) {
                            statu = value!;
                          },
                          items: List.generate(
                              Status.values.length,
                              (index) => DropdownMenuItem(
                                  value: Status.values[index],
                                  child: Text(Status.values[index].value))))
                      : Container(),
                  customButtomElev(
                    lable: id == null ? "add new note" : "edit new note",
                    backColor: black,
                    onPressedFun: () async {
                      if (id != null) {
                        var result = await noVM.editNote(
                          index!,
                          id,
                          title.text,
                          description.text,
                        );
                        showSnackBar(context, result);
                      } else {
                        Note note = Note(
                            title: title.text,
                            description: description.text,
                            noteStats: statu);

                        var result = await noVM.addNote(note);
                        print(result);
                        showSnackBar(context, result);
                      }

                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ));
  }
}
