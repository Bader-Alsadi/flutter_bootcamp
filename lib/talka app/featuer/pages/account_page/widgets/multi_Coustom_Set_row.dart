
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class multiCustomSettingRwo extends StatelessWidget {
   multiCustomSettingRwo({
    super.key,
    this.numberOfRow=0
  });
late int numberOfRow ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: List.generate(
              numberOfRow,
              (index) => Column(
                    children: [
                      CustomSettingRow(),
                      SizedBox(
                        height: miniSpacer * 2,
                      )
                    ],
                  ))),
    );
  }
}
