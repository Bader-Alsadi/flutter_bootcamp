import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/task_manger/core/database/entity/task.dart';
import 'package:app/task_manger/core/database/entity/task_user.dart';
import 'package:app/task_manger/core/helper/db_helper.dart';
import 'package:app/task_manger/core/viewModel/task_view_modle.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController begingC = TextEditingController();
  TextEditingController endC = TextEditingController();
  List<int> users = [];

  @override
  initState() {
    begingC.text = DateTime.now().toString().split(" ").first;
    endC.text = DateTime(2024).toString().split(" ").first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Customfiled(
              lable: "Task Title",
              controller: title,
            ),
            Customfiled(
              lable: "Task Description",
              controller: description,
            ),
            Customfiled(
              controller: begingC,
              lable: begingC.text,
              ontop: () async {
                begingC.text = await showDate(context);
              },
              readOnly: true,
            ),
            Customfiled(
              controller: endC,
              lable: endC.text,
              ontop: () async {
                endC.text = await showDate(context);

                setState(() {});
              },
              readOnly: true,
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: DBhelper.databse.userDao.getAllUser(),
                builder: (context, snapshpt) {
                  if (snapshpt.data!.isNotEmpty) {
                    return Wrap(
                      children: snapshpt.data!
                          .map((e) => StatefulBuilder(
                              builder: (context, setState) => InkWell(
                                  onTap: () {
                                    if (e.isSelecte) {
                                      users.remove(e.id);
                                      e.isSelecte = !e.isSelecte;
                                      setState(() {});
                                    } else {
                                      users.add(e.id!);
                                      e.isSelecte = !e.isSelecte;
                                      setState(() {});
                                    }

                                    print(" $users");
                                  },
                                  child: Chip(
                                      backgroundColor:
                                          e.isSelecte ? black : Colors.grey,
                                      label: Text(
                                        e.name!,
                                        style: TextStyle(
                                            color: e.isSelecte ? white : black),
                                      )))))
                          .toList(),
                    );
                  } else
                    return Center(
                      child: Text("no user"),
                    );
                }),
            customButtomElev(
              backColor: black,
              lable: "save",
              onPressedFun: () async {
                Task task = Task(
                    title: title.text,
                    description: description.text,
                    beging: begingC.text,
                    end: endC.text);
                int id = await TaskVM().addTask(task, users);

                Navigator.pop(context, id);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<String> showDate(BuildContext context) async {
    final Picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));

    return Picker.toString().split(" ").first;
  }
}
