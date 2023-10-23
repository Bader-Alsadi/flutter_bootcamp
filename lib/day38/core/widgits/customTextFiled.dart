import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {required this.label,
      super.key,
      this.controllerv,
      this.isnumber = false});
  bool isnumber;
  late String label;
  TextEditingController? controllerv;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(
            RegExp(isnumber ? r'[0-9]+' : '[a-zA-Z0-9 ]+'))
      ],
      keyboardType: isnumber ? TextInputType.number : null,
      controller: controllerv,
      decoration: InputDecoration(label: Text(this.label)),
    );
  }
}
