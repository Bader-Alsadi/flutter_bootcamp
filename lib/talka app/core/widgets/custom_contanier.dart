import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, this.child = null, this.width,this.backgroundColor});
  double? width;
  Widget? child;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(miniSpacer),
      margin: EdgeInsets.symmetric(
          horizontal: miniSpacer * 2, vertical: miniSpacer),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRaduis), color:backgroundColor?? white),
      width: width ?? MediaQuery.sizeOf(context).width,
      child: child == null ? Center(child: Text("no child")) : child,
    );
  }
}
