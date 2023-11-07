import 'package:app/day48/featuer/contoller/deparment_contoller.dart';
import 'package:app/day48/featuer/models/department_model.dart';
import 'package:app/day48/featuer/pages/course/coures_page.dart';
import 'package:app/day48/featuer/pages/department/add_department_page.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  TextEditingController deparmentName = TextEditingController();
  bool edit = false;
  bool deparmentState = false;
  DeparmentContoller _deparmentContoller = DeparmentContoller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int code = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return AddDeparmentPage();
          }));

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(code == 201 ? "done" : "not done")));
          setState(() {});
        },
        child: Text("add"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      appBar: AppBar(),
      body: FutureBuilder(
          future: _deparmentContoller.fetuchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    padding: EdgeInsets.all(miniSpacer),
                    child: ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: snapshot.data![index].active
                                    ? Colors.green
                                    : Colors.red,
                                child: Text(snapshot.data![index].id),
                              ),
                              title: Text(snapshot.data![index].name),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: Text("Edit"),
                                      onTap: () async {
                                        edit = await showDialog(
                                            context: context,
                                            builder: (context) {
                                              deparmentState =
                                                  snapshot.data![index].active;
                                              deparmentName.text =
                                                  snapshot.data![index].name;
                                              return AlertDialog(
                                                title: Text("editing"),
                                                content: StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      TextField(
                                                        controller:
                                                            deparmentName,
                                                      ),
                                                      CheckboxListTile(
                                                          title: Text(
                                                              "active department"),
                                                          value: deparmentState,
                                                          onChanged: (value) {
                                                            deparmentState =
                                                                value!;
                                                            setState(
                                                              () {},
                                                            );
                                                          }),
                                                      ElevatedButton(
                                                          onPressed: () async {
                                                            int code = await _deparmentContoller.editData(
                                                                department: Department(
                                                                    id: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id,
                                                                    name: deparmentName
                                                                        .text,
                                                                    active:
                                                                        deparmentState));

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(SnackBar(
                                                                    content: Text(code ==
                                                                            200
                                                                        ? "done"
                                                                        : "not done")));

                                                            setState(() {});
                                                            Navigator.pop(
                                                                context,
                                                                code == 200
                                                                    ? true
                                                                    : false);
                                                          },
                                                          child: Text("edit"))
                                                    ],
                                                  );
                                                }),
                                              );
                                            });
                                        if (edit) setState(() {});
                                      },
                                    ),
                                    PopupMenuItem(
                                      child: Text("Delete"),
                                      onTap: () async {
                                        int code = await _deparmentContoller
                                            .DeleteData(
                                                id: snapshot.data![index].id);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(code == 200
                                                    ? "done"
                                                    : "not done")));
                                        setState(() {});
                                      },
                                    ),
                                    PopupMenuItem(
                                      child: Text("Courses"),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return CouresPage(
                                              id: snapshot.data![index].id);
                                        }));
                                      },
                                    ),
                                  ];
                                },
                              ),
                            ),
                        separatorBuilder: (contex, index) => Divider(),
                        itemCount: snapshot.data!.length));
              } else {
                return Center(
                  child: Text("empty"),
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
