import 'package:app/firebase_app/fireStorge/core/helper/hashHL.dart';
import 'package:app/firebase_app/fireStorge/featuer/model/student_model.dart';
import 'package:app/firebase_app/fireStorge/featuer/modelviews/studendMV/studentVM.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var objectF = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final svm = Provider.of<StudentVM>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Customfiled(
            controller: name,
            lable: "name",
          ),
          Customfiled(
            controller: email,
            lable: "email",
          ),
          Customfiled(
            controller: password,
            lable: "passsword",
          ),
          customButtomElev(
            backColor: black,
            lable: "save",
            onPressedFun: () async {
              // objectF
              //     .collection("studnet")
              //     .doc("LPUyZALtLF2AQ4ZnMB83")
              //     .update({"name": "bader"}).whenComplete(() {

              //   showSnackBar(context, "done");
              // });

              Student student = Student(
                  name: name.text,
                  email: email.text,
                  passwword: Hash.encryptPassword(password.text));
              String message = await svm.addStudent(student);

              showSnackBar(context, message);
              Navigator.pop(context);
            },
          )
        ]),
      ),
    );
  }
}
