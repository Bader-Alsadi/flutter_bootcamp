import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customTextfield extends StatelessWidget {
  customTextfield(
      {super.key,
      required this.label,
      this.format = "a-zA-Z0-9",
      this.controller = null});

  late String label;
  String? format;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[$format]')),
      ],
      decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Colors.blue,
              ))),
    );
  }
}
