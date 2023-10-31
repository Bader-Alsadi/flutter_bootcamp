import 'package:app/day46/featuer/contoller/task_contller.dart';
import 'package:app/day46/featuer/pages/add_task.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey();
  TaskContoller taskContoller = TaskContoller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
            backgroundColor: orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () async {
              int code = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return AddTask();
              }));

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(code == 200 ? "done" : "not dane"),
                    );
                  });
            },
            child: Text("add to do")),
      ),
      appBar: AppBar(
        title: Text("to do list"),
        backgroundColor: orange,
      ),
      body: FutureBuilder(
          future: taskContoller.fetuchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Container(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: orange,
                              child: Text(snapshot.data![index].id.toString(),
                                  style: TextStyle(color: white)),
                            ),
                            title: Text(snapshot.data![index].todo!),
                            subtitle: Text(snapshot.data![index].completed!
                                ? "completed"
                                : "uncompleted"),
                            trailing: PopupMenuButton(itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text("delete"),
                                  onTap: () async {
                                    int? code = await taskContoller.deletData(
                                        t: snapshot.data![index]);

                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(code == 200
                                                ? "done"
                                                : "not dane"),
                                          );
                                        });
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text("edit"),
                                  onTap: () async {
                                    int code = await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AddTask(
                                        add: false,
                                      );
                                    }));

                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(code == 200
                                                ? "done"
                                                : "not dane"),
                                          );
                                        });
                                  },
                                )
                              ];
                            }),
                          ),
                        ));
              } else {
                return Center(
                  child: Text("no data"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
