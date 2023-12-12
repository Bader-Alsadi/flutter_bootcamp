import 'package:app/get_x/featuer/viewModel/homa_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  HommVM hvm = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(hvm.number.toString()),
      ),
    );
  }
}
