import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_heading.dart';
import 'package:flutter/material.dart';

class CustomNotes extends StatelessWidget {
  const CustomNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(children: [
        CustomHeading(
          heading: "ملاحظات",
          svg_path: "assets/svg_image/icons/note.svg",
        ),
        Divider(),
        Container(
          decoration: BoxDecoration(color: primary),
          child: TextField(
            maxLines: 7,
            decoration: InputDecoration(
                hintText: "هل هناك شي تريد ان تخبرنا به",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondary),
                    borderRadius: BorderRadius.circular(borderRaduis))),
          ),
        )
      ]),
    );
  }
}
