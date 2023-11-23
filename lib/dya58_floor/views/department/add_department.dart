import 'package:app/dya58_floor/entities/department.dart';
import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/widgets/text_form_fild.dart';
import 'package:flutter/material.dart';

class AddDepartmenttView extends StatefulWidget {
  AddDepartmenttView({super.key, this.department});
  Department? department;
  @override
  State<AddDepartmenttView> createState() => _AddDepmentViewState();
}

class _AddDepmentViewState extends State<AddDepartmenttView> {
  String? pageLable;
  TextEditingController nameCon = TextEditingController();
  GlobalKey<FormState> key_form = GlobalKey();
  @override
  void initState() {
    if (widget.department != null) {
      pageLable = "Edit";
      nameCon.text = widget.department!.name!;
    } else {
      pageLable = "add";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$pageLable New Department"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            onPressed: () async {
              if (nameCon.text.isNotEmpty) {
                if (pageLable == "add") {
                  var s = await DBhelper.databse.departmentDao
                      .addDepartment(Department(
                    name: nameCon.text,
                  ));
                  print("bader $s");
                } else {
                  var s = await DBhelper.databse.departmentDao.updateDepartment(
                      widget.department!..name = nameCon.text);
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
                  lable: "Department name",
                  hint: "Enter Department name",
                ),
                SizedBox(
                  height: minPadding,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
