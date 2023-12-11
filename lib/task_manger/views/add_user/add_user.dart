import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/task_manger/core/database/entity/user.dart';
import 'package:app/task_manger/core/helper/db_helper.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Customfiled(
            lable: "User name",
            controller: name,
          ),
          customButtomElev(
            backColor: black,
            lable: "save",
            onPressedFun: () async {
              User user = User(name: name.text);
              int id = await DBhelper.databse.userDao.insertUser(user);
              Navigator.pop(context, id);
            },
          )
        ],
      ),
    );
  }
}
