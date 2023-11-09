import 'package:flutter/material.dart';

Future<dynamic> customShowbutoomSheet(
    {required BuildContext context, required Widget child}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      // isDismissible: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      context: context,
      builder: (context) {
        return Directionality(textDirection: TextDirection.rtl, child: child);
      });
}
