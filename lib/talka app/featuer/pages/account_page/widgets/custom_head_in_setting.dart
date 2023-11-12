import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class customHeadInSettings extends StatelessWidget {
  const customHeadInSettings({super.key, required this.head});
  final String head;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: miniSpacer * 2), child: Text(head));
  }
}
