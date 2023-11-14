import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  CustomRadioTile({super.key, required this.lable});
  late String lable;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.sizeOf(context).width / 2 - 20,
      decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(
            borderRaduis,
          )),
      child: RadioListTile(
          fillColor: MaterialStatePropertyAll(white),
          title: Text(
            lable,
            style: TextStyle(color: white),
          ),
          value: true,
          groupValue: true,
          onChanged: (value) {}),
    );
  }
}
