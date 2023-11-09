import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';

class customRadioTile extends StatelessWidget {
  customRadioTile(
      {super.key,
      required this.groupValue,
      required this.value,
      this.title = "اختبار",
      this.isHasIcon = true});
  late int groupValue, value;
  late String title;

  bool isHasIcon;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        padding: EdgeInsets.all(miniSpacer - 4),
        decoration: BoxDecoration(
          color: primary,
          border: value == groupValue ? Border.all(color: secondary) : null,
          borderRadius: BorderRadius.circular(borderRaduis),
        ),
        child: RadioListTile(
          value: value,
          groupValue: groupValue,
          onChanged: (newValue) {
            groupValue = newValue!;
            setState() {}
            ;
            Navigator.pop(context);
          },
          title: Text(title),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: secondary,
          hoverColor: secondary,
          secondary: isHasIcon
              ? CustomIconContaner(
                  backgroundColor: white,
                  svg_path: "assets/svg_image/home-svgrepo-com.svg",
                )
              : null,
        ),
      ),
    );
  }
}
