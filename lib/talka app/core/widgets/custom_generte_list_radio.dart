import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_radio_tile.dart';
import 'package:flutter/material.dart';

class CustomGenertListRadio extends StatelessWidget {
  CustomGenertListRadio({super.key, required this.data, this.height});
  List data;
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 368,
      child: ListView.separated(
          itemBuilder: (context, index) => customRadioTile(
                title: data[index],
                groupValue: 1,
                value: index,
                isHasIcon: false,
              ),
          separatorBuilder: (_, __) => SizedBox(
                height: miniSpacer,
              ),
          itemCount: data.length),
    );
  }
}
