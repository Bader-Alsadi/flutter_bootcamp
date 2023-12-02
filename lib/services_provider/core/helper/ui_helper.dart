import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';

String? validateName(String? value) {
  String pattern = r'(^[a-zA-Zا-ي]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return "حقل الاسم متطلب";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "الاسم ينبغي ان يكون من ١-ي او من a-z";
  }
  return null;
}

String? validateCareer(String? value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return "حقل المهنة متطلب";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "المهنة ينبغي ان يكون من ١-ي او من a-z";
  }
  return null;
}

String? validateMobile(String? value) {
  String pattern = r'(^\+?[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return "حقل الهاتف متطلب";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "رقم الجوال يجب ان يتكون من ارقام فقط";
  } else if (value!.length < 9) {
    return "رقم الهاتف يجب ان يكون مكون من ٩ ارقام";
  }
  return null;
}



String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return 'ادخل ايميل صحيح';
  } else {
    return null;
  }
}

pushReplacement(BuildContext context, Widget destination) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => destination));
}

push(BuildContext context, Widget destination) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => destination));
}

bool isDarkMode(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return false;
  } else {
    return true;
  }
}

InputDecoration getInputDecoration(
    {required String hint,
    required bool darkMode,
    required Color errorColor,
    Widget? suffixIcon}) {
  return InputDecoration(
    suffixIconColor: COLOR_PRIMARY,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    fillColor: darkMode ? Colors.black54 : Colors.white,
    hintText: hint,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: COLOR_PRIMARY, width: 2.0)),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(25.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(25.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(25.0),
    ),
  );
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}
