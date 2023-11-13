import 'package:app/database_day/featuers/models/note_model.dart';
import 'package:app/database_day/featuers/viewmodels/note_view_model.dart';
import 'package:app/database_day/featuers/views/add_note.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ShowNotes extends StatefulWidget {
  const ShowNotes({super.key});

  @override
  State<ShowNotes> createState() => _ShowNotesState();
}

class _ShowNotesState extends State<ShowNotes> {
  TextEditingController titleCon = TextEditingController();
  TextEditingController descrptionCon = TextEditingController();
  NoteViewModel noteViewModel = NoteViewModel();
  List<Color> colors = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colors = [orange, secondary, Colors.amber];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddNote();
            }));
            setState(() {});
          },
          child: Text("add"),
        ),
        appBar: AppBar(
          title: Text("show notes"),
        ),
        body: FutureBuilder(
            future: noteViewModel.fetchDate(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return StaggeredGrid.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      snapshot.data!.length,
                      (index) => Column(
                            children: [
                              InkWell
                              
                              (
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                    return AddNote();
                                  }));
                                },
                                child: cardDesign(context, index, snapshot)),
                            ],
                          )),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  SizedBox cardDesign(
      BuildContext context, int index, AsyncSnapshot<List<Note>> snapshot) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2,
      child: Card(
        color: colors[index % 3],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Title:  ${snapshot.data![index].title}",
              style: TextStyle(color: white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: miniSpacer),
            Text(
              "Description:\n ${snapshot.data![index].descrption}",
              style: TextStyle(color: white),
            ),
          ]),
        ),
      ),
    );
  }
}

//   Visibility newMethod(
//       AsyncSnapshot<List<Note>> snapshot, int index, BuildContext context) {
//     return Visibility(
//       visible: false,
//       child: SizedBox(
//         width: 300,
//         child: Column(
//           children: [
//             TextField(
//               controller: titleCon,
//             ),
//             TextField(
//               controller: descrptionCon,
//             ),
//             Container(
//               padding: EdgeInsets.all(miniSpacer),
//               child: Text(snapshot.data![index].date),
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   String message = "";
//                   int code =
//                       await noteViewModel.updateData(snapshot.data![index]
//                         ..title = titleCon.text
//                         ..descrption = descrptionCon.text);
//                   message = code > 0 ? "done" : "not done";
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text(message)));
//                   // snapshot.data![index].status = 0;
//                   setState(() {});
//                 },
//                 child: Text("save"))
//           ],
//         ),
//       ),
//     );
//   }

//   ListTile listtile(AsyncSnapshot<List<Note>> snapshot, int index) {
//     return ListTile(
//       leading: CircleAvatar(
//         child: Text(snapshot.data![index].id.toString()),
//       ),
//       title: Text(snapshot.data![index].title),
//       subtitle: Text(snapshot.data![index].descrption),
//       trailing: PopupMenuButton(
//         itemBuilder: (context) {
//           return [
//             PopupMenuItem(
//               child: Text("Edit"),
//               onTap: () async {
//                 // snapshot.data![index].status = 1;
//                 // setState(() {});
//                 titleCon.text = snapshot.data![index].title;
//                 descrptionCon.text = snapshot.data![index].descrption;
//               },
//             ),
//             PopupMenuItem(
//               child: Text("Delete"),
//               onTap: () async {
//                 String message = "";
//                 int code =
//                     await noteViewModel.deleteData(snapshot.data![index].id!);

//                 message = code > 0 ? "done" : "not done";
//                 ScaffoldMessenger.of(context)
//                     .showSnackBar(SnackBar(content: Text(message)));
//                 setState(() {});
//               },
//             ),
//           ];
//         },
//       ),
//     );
//   }
// }
