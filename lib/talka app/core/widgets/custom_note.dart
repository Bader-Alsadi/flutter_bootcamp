import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_heading.dart';
import 'package:app/talka%20app/featuer/pages/card_page/card_page.dart';
import 'package:flutter/material.dart';

class CoutomNotes extends StatelessWidget {
  const CoutomNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(children: [
        CustomHeading(
          heading: "ملاحظات",
          icon: Icon(Icons.note),
        ),
        Divider(),
        Container(
          decoration: BoxDecoration(color: primary),
          child: TextField(
            maxLines: 7,
            decoration: InputDecoration(
                hintText: "هل هناك شي تريد ان تخبرنا به",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondary),
                    borderRadius:
                        BorderRadius.circular(borderRaduis))),
          ),
        )
      ]),
    );
  }
}
