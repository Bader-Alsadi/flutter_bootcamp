import 'package:app/get_x/featuer/viewModel/homa_vm.dart';
import 'package:app/get_x/featuer/views/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HimmeScreen extends StatelessWidget {
  HimmeScreen({super.key});

  HommVM hvm = Get.put(HommVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: GetBuilder<HommVM>(
          builder: (homevn) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      hvm.addOnbe();
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                      Get.to(SecondPage());
                    },
                  )
                ],
              )),
      body: GetX<HommVM>(
          init: HommVM(),
          builder: (hommVM) => Center(
                child: Text("${hvm.number.toString()} - ${hvm.x.toString()}"),
              )),
    );
  }
}
