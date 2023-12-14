import 'package:app/services_provider/core/helper/get_storge_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoconnectionPage extends StatelessWidget {
  NoconnectionPage({super.key});
  static const String ROUTE = "no connection";
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
          child: SvgPicture.asset("assets/No data-bro.svg"),
        ),
      ),
    );
  }
}
