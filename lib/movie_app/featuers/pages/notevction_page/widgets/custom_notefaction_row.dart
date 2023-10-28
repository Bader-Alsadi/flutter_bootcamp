import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNotefactionRow extends StatelessWidget {
  CustomNotefactionRow({
    this.name = "",
    this.descrption = "",
    this.time = "",
    super.key,
  });
  late String name, descrption, time;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: bottomColor, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(
              horizontal: miniSpacer + 5, vertical: miniSpacer),
          margin: EdgeInsets.symmetric(horizontal: miniSpacer),
          child: FaIcon(
            FontAwesomeIcons.itunesNote,
            color: yellow,
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this.name),
                SizedBox(
                  height: miniSpacer - 4,
                ),
                Text(
                  this.descrption,
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
                SizedBox(
                  height: miniSpacer,
                ),
                Text(this.time)
              ],
            ),
          ),
        ),
        PopupMenuButton(
          
            padding: EdgeInsets.all(0), itemBuilder: (context) => [])
      ],
    );
  }
}
