import 'package:app/movie_app/core/Data/duartion_radio.dart';
import 'package:app/movie_app/core/Data/video_duality_radio.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/cuntom_Elevated_button.dart';
import 'package:app/movie_app/core/widgets/custom_divider.dart';
import 'package:app/movie_app/core/widgets/custom_title_subtitle.dart';
import 'package:app/movie_app/featuers/pages/custom_plan_pages/widgets/cumstom_dadio.dart';
import 'package:app/movie_app/featuers/pages/custom_plan_pages/widgets/custom_list_tile_divece.dart';
import 'package:flutter/material.dart';

class CustomPlanPage extends StatefulWidget {
  const CustomPlanPage({super.key});

  @override
  State<CustomPlanPage> createState() => _CustomPlanState();
}

class _CustomPlanState extends State<CustomPlanPage> {
  String groupDuartionValue = listDuartionValue[0];
  String groupVidedQutyValue = videoRadioValus[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: customAppBar(
              title: "cuttom paln",
              elevation: 1,
            )),
        backgroundColor: primary,
        body: Container(
          padding: EdgeInsets.all(miniSpacer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRadio(
                  context: context,
                  title: "Duartion",
                  groupValue: listDuartionValue[0],
                  radioValues: listDuartionValue),
              CustomDivider(
                colorDivder: white.withOpacity(.3),
                thickness: 1,
              ),
              CustomRadio(
                  context: context,
                  title: "video quallty",
                  groupValue: videoRadioValus[1],
                  radioValues: videoRadioValus),
              CustomDivider(
                colorDivder: white.withOpacity(.3),
                thickness: 1,
              ),
              CustomListTileDivece(),
              CustomDivider(
                colorDivder: white.withOpacity(.3),
                thickness: 1,
              ),
              CustomRadio(
                  context: context,
                  title: "cancel any time",
                  groupValue: "yes",
                  radioValues: ["yes", "no"]),
              CustomDivider(
                colorDivder: white.withOpacity(.3),
                thickness: 1,
              ),
              SizedBox(
                height: spacer,
              ),
              Align(
                alignment: Alignment.center,
                child: customElevatedButton(
                  navigator: payment2,
                  TextValue: "continue \$89",
                  backgroundColor: bottomColor,
                  textColor: yellow,
                  width: 350,
                ),
              ),
              SizedBox(
                height: miniSpacer,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 350,
                  child: customTitleSubtitle(
                    tilte: "by sigrin up you to agree to our privcey",
                    subtitle: "privecy and trems",
                    subtitlecolor: yellow,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
