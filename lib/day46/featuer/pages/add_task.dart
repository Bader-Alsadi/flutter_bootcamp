import 'package:app/day46/featuer/contoller/task_contller.dart';
import 'package:app/day46/featuer/model/task.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key, this.add = true});
  bool add;
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TaskContoller taskContoller = TaskContoller();
  TextEditingController textCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextField(
          controller: textCon,
        ),
        ElevatedButton(
            onPressed: () async {
              if (widget.add) {
                int? code = await taskContoller.saveData(
                    t: Task(
                        id: 1, todo: textCon.text, completed: true, userId: 2));
                Navigator.pop(context, code);
              } else {
                int? code = await taskContoller.editData(
                    t: Task(
                        id: 1, todo: textCon.text, completed: true, userId: 2));
                Navigator.pop(context, code);
              }
            },
            child: Text("save"))
      ]),
    );
  }
}
