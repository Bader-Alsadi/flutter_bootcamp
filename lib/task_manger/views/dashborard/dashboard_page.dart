import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/task_manger/core/helper/db_helper.dart';
import 'package:app/task_manger/core/viewModel/task_view_modle.dart';
import 'package:app/task_manger/views/add_task.dart/add_task.dart';
import 'package:app/task_manger/views/add_user/add_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 130,
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(65),
                  child: Image.asset(
                    'assets/placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text("Users"),
                leading: Icon(Icons.person),
              ),
              ListTile(
                onTap: () async {
                  int id = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddUser()));
                  if (id > 0) {
                    message = "user add succssfuly id= $id";
                  } else
                    message = "faild id= $id";

                  showSnackBar(context, message);
                },
                title: Text("Add_user"),
                leading: Icon(Icons.add_reaction),
              ),
              ListTile(
                onTap: () async {
                  int id = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTaskPage()));
                  if (id > 0) {
                    message = "tasl add succssfuly id= $id";
                  } else
                    message = "faild id= $id";

                  showSnackBar(context, message);
                  Navigator.pop(context);
                },
                title: Text("Add_task"),
                leading: Icon(Icons.task),
              ),
            ],
          ),
        ),
        body: Consumer<TaskVM>(
          builder: (context, taskVM, chid) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder(
                  future: DBhelper.databse.taskDao.getAllTask(),
                  builder: (context, snapshot) {
                    print(" user ${taskVM.usersId}");
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => Card(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title:
                                            Text(snapshot.data![index].title!),
                                        titleAlignment:
                                            ListTileTitleAlignment.bottom,
                                        subtitle: Text(
                                            snapshot.data![index].description!),
                                        contentPadding: EdgeInsets.all(0),
                                        leading: Column(
                                          children: [
                                            Text(snapshot.data![index].beging!),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(snapshot.data![index].end!),
                                          ],
                                        ),
                                        trailing: PopupMenuButton(
                                            itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    onTap: () async {
                                                      int id = await DBhelper
                                                          .databse.taskDao
                                                          .deleteTask(snapshot
                                                              .data![index]);
                                                      if (id > 0) {
                                                        message =
                                                            "task delete succssfuly id= $id";
                                                      } else
                                                        message =
                                                            "faild id= $id";

                                                      showSnackBar(
                                                          context, message);
                                                    },
                                                    child: Text("delete"),
                                                  ),
                                                  PopupMenuItem(
                                                    onTap: () {
                                                      // showBottomSheet(context: context, builder: (context)=>conte)
                                                    },
                                                    child: Text("edit"),
                                                  ),
                                                ]),
                                      ),
                                      FutureBuilder(
                                          future: DBhelper.databse.userDao
                                              .getAllUserbytaskId(
                                                  snapshot.data![index].id!),
                                          builder: (context, snapshpt) {
                                            if (snapshpt.data!.isNotEmpty) {
                                              return Wrap(
                                                children: snapshpt.data!
                                                    .map((e) => StatefulBuilder(
                                                        builder: (context,
                                                                setState) =>
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Chip(
                                                                  backgroundColor:
                                                                      black,
                                                                  label: Text(
                                                                    e.name!,
                                                                    style: TextStyle(
                                                                        color:
                                                                            white),
                                                                  )),
                                                            )))
                                                    .toList(),
                                              );
                                            } else
                                              return Center(
                                                child: Text("no user"),
                                              );
                                          }),
                                    ],
                                  ),
                                ));
                      } else
                        return Center(child: Text("empty"));
                    } else
                      return Center(child: CircularProgressIndicator());
                  })),
        ));
  }
}
