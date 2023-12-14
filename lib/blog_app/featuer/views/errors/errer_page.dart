import 'package:app/services_provider/core/helper/get_storge_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';

class Error404 extends StatelessWidget {
  Error404({super.key});
  static const String ROUTE = "error404";
  String name = GetStorageHelper.get_box("user").read("name");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_SECONDRY,
        title: Text("welcom my dear $name"),
        elevation: 0,
      ),
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
        child: Center(
          child: Image.asset("assets/404 error with a tired person (1).gif"),
        ),
      ),
    );
  }
}
