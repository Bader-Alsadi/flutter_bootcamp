
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/talka%20app/core/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomTrlingWidgets extends StatelessWidget {
  const CustomTrlingWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          CustomIcon(
            icon: Icons.lock_clock,
          ),
          Text("أضافة المزيد")
        ],
      ),
    );
  }
}