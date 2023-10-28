
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomHeadWithIconTriler extends StatelessWidget {
  const CustomHeadWithIconTriler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle_outlined,
          color: white.withOpacity(0.4),
        ),
        Text(
          "All",
          style: TextStyle(
            color: white.withOpacity(0.4),
          ),
        ),
        Expanded(child: Container()),
        Icon(
          Icons.delete,
          color: white.withOpacity(0.4),
        ),
      ],
    );
  }
}
