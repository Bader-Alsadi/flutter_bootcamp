import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';

class Customfiled extends StatelessWidget {
  Customfiled(
      {super.key,
      this.lable,
      this.validate,
      this.maxLines = 1,
      this.filedType,
      this.controller});
  String? lable;
  TextEditingController? controller;
  String? Function(String?)? validate;
  int? maxLines;
  TextInputType? filedType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
      child: TextFormField(
          controller: this.controller,
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.next,
          validator: validate,
          style: const TextStyle(fontSize: 18.0),
          keyboardType: filedType ?? TextInputType.name,
          cursorColor: COLOR_PRIMARY,
          decoration: getInputDecoration(
              hint: lable!,
              darkMode: isDarkMode(context),
              errorColor: Theme.of(context).colorScheme.error)),
    );
  }
}
