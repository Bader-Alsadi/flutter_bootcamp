import 'dart:collection';

import 'package:app/day28_ecx/q3/Task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TextEditingController textTitle = TextEditingController();
  TextEditingController textDes = TextEditingController();
  GlobalKey<FormState> form_Key = GlobalKey();
  int? currenitem;
  List<Task> listTask = [];
  String buttonState = "Add";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var paddingSize = size.width / 18;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding:
              EdgeInsets.only(top: 100, left: paddingSize, right: paddingSize),
          // color: Colors.blue,
          child: Column(children: [
            Form(
                key: form_Key,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (x) {
                        if (x!.isEmpty)
                          return "Enter Title";
                        else {
                          if (x!.length > 3)
                            return null;
                          else
                            return "Length most be more then 3";
                        }
                      },
                      controller: textTitle,
                      decoration: InputDecoration(
                        hintText: "Enter Task Title",
                        label: Text(
                          "Title",
                          style: TextStyle(fontSize: 18),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      validator: (x) {
                        if (x!.isEmpty)
                          return "Enter Description";
                        else {
                          if (x!.length > 10)
                            return null;
                          else
                            return "Length most be more then 10";
                        }
                      },
                      controller: textDes,
                      decoration: InputDecoration(
                        hintText: "Enter Task Description",
                        label: Text(
                          "Description",
                          style: TextStyle(fontSize: 18),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          if (form_Key.currentState!.validate()) {
                            if (buttonState == "Add") {
                              listTask.add(Task(
                                  title: textTitle.text,
                                  descripction: textDes.text));
                            } else {
                              listTask[currenitem!].title = textTitle.text;
                              listTask[currenitem!].descripction = textDes.text;
                            }

                            textTitle.text = "";
                            textDes.text = "";
                            buttonState = "Add";
                            setState(() {});
                          }
                        },
                        child: Text("$buttonState"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )),
            Container(
                width: size.width,
                // height: 200,
                child: Column(
                  children: List.generate(
                    listTask.length,
                    (index) {
                      return Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: CircleAvatar(
                                  radius: 12, child: Text("${index + 1}")),
                            ),
                            Container(
                              width: size.width / 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${listTask[index].title}",
                                    style: TextStyle(color: Colors.blue[400]),
                                  ),
                                  Text("${listTask[index].descripction}"),
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  listTask.removeAt(index);
                                  setState(() {});
                                },
                                child: Icon(Icons.delete)),
                            InkWell(
                                onTap: () {
                                  textTitle.text = listTask[index].title;
                                  textDes.text = listTask[index].descripction;
                                  buttonState = "Edit";
                                  currenitem = index;
                                  setState(() {});
                                },
                                child: Icon(Icons.edit)),
                          ],
                        ),
                      );
                    },
                  ),
                ))
          ]),
        )),
      ),
    );
  }
}
