import 'dart:io';

import 'package:app/blog_app/core/helper/getStroge/getStroge_he;per.dart';
import 'package:app/blog_app/featuer/viewmodels/artical_vm.dart';
import 'package:app/blog_app/featuer/views/display_page/dispaly_page.dart';
import 'package:app/blog_app/featuer/views/errors/errer_page.dart';
import 'package:app/blog_app/featuer/views/no_connection/no_concttion.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/services_provider/core/widgets/custom_heda.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddArtical extends StatelessWidget {
  AddArtical({super.key});

  static const String ROUTE = "AddArtical";
  String name = GetStorageHelper.get_box("user").read("name");
  String tokken = GetStorageHelper.get_box("user").read("token");

  final GlobalKey<FormState> FormKey = GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  File? image;
  String? image_name;

  @override
  Widget build(BuildContext context) {
    final avm = Provider.of<ArticalVM>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: COLOR_SECONDRY,
          title: Text("welcom my dear $name"),
          elevation: 0,
        ),
        body: Container(
            decoration:
                BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
            child: Form(
              key: FormKey,
              autovalidateMode: _validate,
              child: ListView(
                children: [
                  customHeadingSP(
                    head: 'Add Artiacl',
                  ),
                  SizedBox(
                    height: spacer,
                  ),
                  Icon(
                    Icons.article,
                    color: COLOR_PRIMARY,
                    size: 80,
                  ),
                  Customfiled(
                    lable: "Artical Title",
                    // validate: validateEmail,
                    controller: title,
                  ),
                  Customfiled(
                    maxLines: 10,
                    lable: "Artiacl Content",
                    controller: content,
                  ),
                  customButtomElev(
                    lable: "Add image",
                    backColor: COLOR_PRIMARY,
                    padding: 20,
                    onPressedFun: () async {
                      image = await avm.getImage();
                      image_name = image!.path.split("/").last.split(".").first;
                      print(image_name);
                    },
                  ),
                  customButtomElev(
                      lable: "save",
                      backColor: COLOR_PRIMARY,
                      onPressedFun: () async {
                        if (FormKey.currentState!.validate()) {
                          FormData data = FormData.fromMap({
                            "title": title.text,
                            "content": content.text,
                            "image": MultipartFile.fromFileSync(image!.path,
                                filename: image_name),
                          });
                          int code = await avm.addArtical(data, tokken);

                          if (code == 1200) {
                            showSnackBar(context, "succssfuly");
                            Navigator.pop(context);
                          } else if (code == 1300) {
                            showSnackBar(context, "falid");
                          } else if (code == 404) {
                            Navigator.pushNamed(context, Error404.ROUTE);
                          } else if (code == 500) {
                            showSnackBar(context,
                                "data not commpleted or your tokkin is in correct");
                          } else {
                            Navigator.pushNamed(
                                context, NoconnectionPage.ROUTE);
                          }
                        }
                      }),
                ],
              ),
            )));
  }
}
