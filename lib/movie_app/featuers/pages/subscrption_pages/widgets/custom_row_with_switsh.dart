import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class CustoumRowWithSwitsh extends StatelessWidget {
  CustoumRowWithSwitsh({
    super.key,
    this.active = false,
    this.valueSwitsh = false,
    this.title = "test",
  });
  bool valueSwitsh, active;
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: miniSpacer, vertical: miniSpacer / 3),
            decoration: BoxDecoration(
                color: yellow, borderRadius: BorderRadius.circular(5)),
            child: Text(
              active ? "Active" : "Expired",
              style: TextStyle(color: black, fontWeight: FontWeight.w500),
            )),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2,
          child: SwitchListTile(
            thumbColor: MaterialStateProperty.all(yellow),
            trackOutlineColor: MaterialStateProperty.all(yellow),
            trackColor: MaterialStateProperty.all(bottomColor),
            controlAffinity: ListTileControlAffinity.leading,
            value: this.valueSwitsh,
            onChanged: (value) {},
            title: Text("Auto Renew",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                )),
          ),
        ),
        Text(
          this.title,
          style: TextStyle(color: yellow, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
