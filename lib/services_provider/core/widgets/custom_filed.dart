import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Customfiled extends StatelessWidget {
  Customfiled(
      {super.key,
      this.lable,
      this.validate,
      this.maxLines = 1,
      this.readOnly = false,
      this.filedType,
      this.ontop,
      this.filterPattern = '[]',
      this.onchange,
      this.enable = true,
      this.controller});

  bool enable;
  String? lable;
  TextEditingController? controller;
  String? Function(String?)? validate;
  int? maxLines;
  bool? readOnly;
  void Function()? ontop;
  void Function(String)? onchange;
  String? filterPattern;
  TextInputType? filedType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
      child: TextFormField(
          enabled: enable,
          onChanged: onchange,
          onTap: ontop,
          readOnly: readOnly!,
          controller: this.controller,
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.next,
          validator: validate,
          style: const TextStyle(fontSize: 18.0),
          keyboardType: filedType ?? TextInputType.name,
          cursorColor: COLOR_PRIMARY,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(filterPattern!))
          ],
          decoration: getInputDecoration(
              hint: lable!,
              darkMode: isDarkMode(context),
              errorColor: Theme.of(context).colorScheme.error)),
    );
  }
}
