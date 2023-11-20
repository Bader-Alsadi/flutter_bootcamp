import 'package:app/dya58_floor/entities/sudent.dart';
import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/widgets/drop_down_list.dart';
import 'package:app/dya58_floor/views/widgets/text_form_fild.dart';
import 'package:flutter/material.dart';

class AddStudentView extends StatefulWidget {
  const AddStudentView({super.key});

  @override
  State<AddStudentView> createState() => _AddStudentViewState();
}

class _AddStudentViewState extends State<AddStudentView> {
  int department_value = 1;
  bool studentState = false;
  List<int> courses = [];
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Student"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            onPressed: () async {
              var s = await DBhelper.databse.studentDao.addStudent(Student(
                  name: nameCon.text,
                  email: emailCon.text,
                  phoneNo: phoneCon.text,
                  active: studentState,
                  depratmentId: department_value));
              print("bader $s");
            },
            child: Text("Add New Student")),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFileCustom(
                controller: nameCon,
                lable: "Sutudent name",
                hint: "Enter sutdent name",
              ),
              SizedBox(
                height: minPadding,
              ),
              TextFileCustom(
                controller: emailCon,
                lable: "Sutudent Emaile",
                hint: "Enter sutdent Emaile",
              ),
              SizedBox(
                height: minPadding,
              ),
              TextFileCustom(
                controller: phoneCon,
                lable: "Sutudent Phone",
                hint: "Enter sutdent Phone",
              ),
              SizedBox(
                height: minPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                      future: DBhelper.databse.departmentDao.getAllDepartment(),
                      builder: (context, snapshpt) {
                        if (snapshpt.hasData) {
                          return CoustomContianer(
                            lable: "Department Course",
                            widgetSend: DropdownButton(
                                underline: Container(),
                                value: department_value,
                                items: snapshpt.data!
                                    .map((e) => DropdownMenuItem(
                                        value: e.id, child: Text(e.name!)))
                                    .toList(),
                                onChanged: (value) {
                                  department_value = value!;
                                  setState(() {});
                                }),
                          );
                        } else {
                          return Text("empty");
                        }
                      }),
                  CoustomContianer(
                    withBorder: false,
                    lable: "Sudent State",
                    widgetSend: Checkbox(
                        activeColor: secondry,
                        value: studentState,
                        onChanged: (value) {
                          studentState = value!;
                          setState(() {});
                        }),
                  )
                ],
              ),
              SizedBox(
                height: smallPadding,
              ),
              Text(
                "Courses",
                style: subTitle,
              ),
              FutureBuilder(
                  future: DBhelper.databse.courseDao.getAllCourse(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        children: snapshot.data!
                            .map((e) => InkWell(
                                  onTap: () {
                                    if (courses.any((eL) => eL == e.id)) {
                                      courses.remove(e.id);
                                    } else {
                                      courses.add(e.id!);
                                    }

                                    print(courses);
                                    setState(() {});
                                  },
                                  child: Chip(
                                      backgroundColor:
                                          courses.any((eL) => eL == e.id)
                                              ? secondry
                                              : primary,
                                      label: Text(
                                        "${e.name!}:${e.hours!} Hs",
                                        style: TextStyle(
                                            color:
                                                courses.any((eL) => eL == e.id)
                                                    ? white
                                                    : black),
                                      )),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(child: Text("no course yet"));
                    }
                  }),
              // SizedBox(
              //   height: spacer,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
