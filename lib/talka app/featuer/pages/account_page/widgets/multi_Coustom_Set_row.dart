import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class multiCustomSettingRwo extends StatelessWidget {
  multiCustomSettingRwo({super.key, required this.data});
  late List<Map> data;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            data.length,
            (index) => Column(
                  children: [
                    CustomSettingRow(
                      title: data[index]["title"],
                      subTitle: data[index]["subTitle"],
                      svg_path: data[index]["svg_path"],
                    ),
                    SizedBox(
                      height: miniSpacer,
                    )
                  ],
                )));
  }
}
