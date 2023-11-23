import 'package:app/dya58_floor/entities/course.dart';
import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/widgets/drop_down_list.dart';
import 'package:app/dya58_floor/views/widgets/text_form_fild.dart';
import 'package:flutter/material.dart';

class AddCourseView extends StatefulWidget {
  AddCourseView({super.key, this.course});
  Course? course;
  @override
  State<AddCourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {
  String? pageLable;
  TextEditingController nameCon = TextEditingController();
  TextEditingController HoureCon = TextEditingController();
  GlobalKey<FormState> key_form = GlobalKey();
  int department_value = 1;
  @override
  void initState() {
    if (widget.course != null) {
      pageLable = "Edit";
      nameCon.text = widget.course!.name!;
      HoureCon.text = widget.course!.hours.toString();
    } else {
      pageLable = "add";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$pageLable New Course"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            onPressed: () async {
              if (nameCon.text.isNotEmpty) {
                if (pageLable == "add") {
                  var s = await DBhelper.databse.courseDao.addCourse(Course(
                      name: nameCon.text,
                      hours: int.tryParse(HoureCon.text),
                      depratmentId: department_value));
                  print("bader $s");
                } else {
                  var s = await DBhelper.databse.courseDao
                      .updateCourse(
                          widget.course!..name=nameCon.text..hours=int.tryParse(HoureCon.text)..depratmentId=department_value)
                           ;
                  print("update $s");
                }
              } else {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("error"),
                          content: Text("enter all the filed!"),
                        ));
              }
              Navigator.pop(context);
            },
            child: Text("$pageLable New Student")),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: key_form,
            // autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFileCustom(
                  controller: nameCon,
                  lable: "Coures name",
                  hint: "Enter Coures name",
                ),
                SizedBox(
                  height: minPadding,
                ),
                TextFileCustom(
                  controller: HoureCon,
                  lable: "Coures houres",
                  hint: "Enter Coures houres",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder(
                        future:
                            DBhelper.databse.departmentDao.getAllDepartment(),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
