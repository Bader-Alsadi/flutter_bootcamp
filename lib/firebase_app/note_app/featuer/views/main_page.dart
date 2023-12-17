import 'package:app/firebase_app/note_app/core/constan/note_state_enum.dart';
import 'package:app/firebase_app/note_app/featuer/model/note_modle.dart';
import 'package:app/firebase_app/note_app/featuer/notes_VM/notes_VM.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MianPage extends StatelessWidget {
  MianPage({super.key});
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  late NoteStats noteStats = NoteStats.get_stared;

  @override
  Widget build(BuildContext context) {
    final noVM = Provider.of<NoteVM>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            newMethod(context, noVM);
          },
          child: Icon(Icons.add_comment_outlined),
        ),
        appBar: AppBar(
          title: Text("note app"),
        ),
        body: Consumer<NoteVM>(
            builder: (context, nvm, _) => ListView.builder(
                itemCount: nvm.getAllNote().length,
                itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(20),
                      child: ListTile(
                        title: Text("${nvm.getAllNote()[index].title}"),
                        subtitle:
                            Text("${nvm.getAllNote()[index].description}"),
                        trailing: Column(
                        
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Chip(
                                  label: Text(
                                      "${nvm.getAllNote()[index].noteStats.value}")),
                            ),
                            Flexible(
                              child: Visibility(
                                  visible: nvm.getAllNote()[index].noteStats !=
                                      NoteStats.done,
                                  child: PopupMenuButton(
                                      icon: Icon(Icons.settings),
                                      itemBuilder: (context) => [
                                            PopupMenuItem(
                                              child: Text("update state"),
                                              onTap: () {
                                                noteStats = nvm
                                                    .getAllNote()[index]
                                                    .noteStats;
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
                                                              children: NoteStats
                                                                  .values
                                                                  .map((e) => RadioListTile(
                                                                      title: Text(e.value),
                                                                      value: e,
                                                                      groupValue: nvm.getAllNote()[index].noteStats,
                                                                      onChanged: index <= nvm.getAllNote()[index].noteStats.index
                                                                          ? null
                                                                          : (value) {
                                                                              nvm.getAllNote()[index].noteStats = value! as NoteStats;
                                                                              nvm.changeNoteState(nvm.getAllNote()[index].id, nvm.getAllNote()[index].noteStats);

                                                                              Navigator.pop(context);
                                                                            }))
                                                                  .toList()),
                                                        ));
                                              },
                                            ),
                                            PopupMenuItem(
                                              child: Text("eidt"),
                                              onTap: () {
                                                title.text = nvm
                                                    .getAllNote()[index]
                                                    .title;
                                                description.text = nvm
                                                    .getAllNote()[index]
                                                    .description;
                                                newMethod(context, noVM,
                                                    id: index);
                                              },
                                            ),
                                            PopupMenuItem(
                                              child: Text("delete"),
                                              onTap: () {
                                                nvm.deletNote(
                                                    nvm.getAllNote()[index].id);
                                              },
                                            ),
                                          ])),
                            ),
                          ],
                        ),
                      ),
                    ))));
  }

  PersistentBottomSheetController<dynamic> newMethod(
      BuildContext context, NoteVM noVM,
      {int? id}) {
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
                          value: noteStats,
                          onChanged: (value) {
                            noteStats = value! as NoteStats;
                          },
                          items: List.generate(
                              NoteStats.values.length,
                              (index) => DropdownMenuItem(
                                  value: NoteStats.values[index],
                                  child: Text(NoteStats.values[index].value))))
                      : Container(),
                  customButtomElev(
                    lable: id == null ? "add new note" : "edit new note",
                    backColor: black,
                    onPressedFun: () {
                      if (id != null) {
                        print("eisd");
                        noVM.editNote(noVM.getAllNote()[id].id, title.text,
                            description.text);
                        title.clear();
                        description.clear();
                      } else {
                        int id = noVM.getAllNote().isNotEmpty
                            ? noVM.getAllNote().last.id + 1
                            : 1;
                        Note note = Note(
                            id: id,
                            title: title.text,
                            description: description.text,
                            noteStats: noteStats);

                        noVM.addNote(note);
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
