import 'package:app/day59/featuer/modle/task.dart';
import 'package:app/day59/featuer/viewModle/task_viewmode;.dart';
import 'package:flutter/material.dart';

class TaskH extends StatefulWidget {
  const TaskH({super.key});

  @override
  State<TaskH> createState() => _TaskHState();
}

class _TaskHState extends State<TaskH> {
  TaslVM TVM = TaslVM();
  TextEditingController titleC = TextEditingController();
  TextEditingController descrC = TextEditingController();
  List<Task> tasks = [];
  @override
  void initState() {
    super.initState();
    tasks = TVM.fetch();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    tasks = TVM.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                      content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleC,
                        decoration: InputDecoration(hintText: "title"),
                      ),
                      TextField(
                        controller: descrC,
                        decoration: InputDecoration(hintText: "descrption"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            TVM.addTask(Task(
                                title: titleC.text,
                                state: false,
                                description: descrC.text));
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Text("add"))
                    ],
                  )));
        }),
        appBar: AppBar(
          title: Text("hive"),
        ),
        body: Column(
          children: List.generate(
            tasks.length,
            (index) => ListTile(
              title: Text(tasks[index].title),
              subtitle: Text(tasks[index].title),
              trailing: InkWell(
                onTap: () {
                  if (!tasks[index].state)
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      TVM.UpdateTask(
                                          tasks[index]..state = true);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Text("add as completed"))
                              ],
                            )));
                },
                child: Icon(
                  Icons.check,
                  color: tasks[index].state ? Colors.green : Colors.red,
                ),
              ),
            ),
          ),
        ));
  }
}
