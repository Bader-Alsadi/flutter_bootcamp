import 'package:app/dya58_floor/entities/sudent.dart';
import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/widgets/drop_down_list.dart';
import 'package:app/dya58_floor/views/widgets/text_form_fild.dart';
import 'package:flutter/material.dart';

class AddStudentView extends StatefulWidget {
  AddStudentView({super.key, this.student});
  Student? student;
  @override
  State<AddStudentView> createState() => _AddStudentViewState();
}

class _AddStudentViewState extends State<AddStudentView> {
  String? pageLable;
  int department_value = 1;
  bool studentState = false;
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  GlobalKey<FormState> key_form = GlobalKey();
  @override
  void initState() {
    if (widget.student != null) {
      pageLable = "Edit";
      nameCon.text = widget.student!.name!;
      emailCon.text = widget.student!.email!;
      phoneCon.text = widget.student!.phoneNo!;
      department_value = widget.student!.depratmentId!;
      studentState = widget.student!.active!;
    } else {
      pageLable = "add";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$pageLable New Student"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            onPressed: () async {
              if (nameCon.text.isNotEmpty &&
                  emailCon.text.isNotEmpty &&
                  phoneCon.text.isNotEmpty) {
                if (pageLable == "add") {
                  var s = await DBhelper.databse.studentDao.addStudent(Student(
                      name: nameCon.text,
                      email: emailCon.text,
                      phoneNo: phoneCon.text,
                      active: studentState,
                      depratmentId: department_value));
                  print("bader $s");
                } else {
                  var s = await DBhelper.databse.studentDao
                      .updateStudent(widget.student!
                        ..name = nameCon.text
                        ..email = emailCon.text
                        ..phoneNo = phoneCon.text
                        ..active = studentState
                        ..depratmentId = department_value);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
