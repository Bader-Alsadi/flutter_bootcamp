import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class custoumSinginWithSocialMedai extends StatelessWidget {
  custoumSinginWithSocialMedai({
    super.key,
    required this.textAboveIcons,
    required this.firstIcon,
    required this.secondIcon,
    required this.thirdIcon,
    required this.mediaData,
    this.textColor,
    this.iconColor,
  });
  late List<String> mediaData;
  late String textAboveIcons;
  late IconData firstIcon, secondIcon, thirdIcon;
  Color? textColor, iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAboveIcons,
          style: TextStyle(color: textColor == null ? white : textColor),
        ),
        SizedBox(
          height: miniSpacer,
        ),
        Row(
          children: List.generate(
              mediaData.length,
              (index) => Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: white,
                      child: Image.asset(mediaData[index]),
                    ),
                  )),
        )
      ],
    );
  }
}
