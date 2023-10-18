import 'package:app/Data/duartion_radio.dart';
import 'package:app/Data/video_duality_radio.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/widgets/coustom_abb_bar.dart';
import 'package:app/widgets/cuntom_Elevated_button.dart';
import 'package:app/widgets/custom_divider.dart';
import 'package:app/widgets/custom_title_subtitle.dart';
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
              customRadio(
                  context: context,
                  title: "Duartion",
                  groupValue: listDuartionValue[0],
                  radioValues: listDuartionValue),
              CustomDivider(
                colorDivder: white.withOpacity(.3),
                thickness: 1,
              ),
              customRadio(
                  context: context,
                  title: "video quallty",
                  groupValue: videoRadioValus[1],
                  radioValues: videoRadioValus),
              CustomDivider(
                colorDivder: white.withOpacity(.3),
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  "divece".toUpperCase(),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: white, fontSize: 17),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.4,
                        height: smallSpacer,
                        child: Text(
                          "Screen you can watch from any where",
                          style: TextStyle(color: white.withOpacity(0.5)),
                        ),
                      ),
                      Text(
                        "Chosce number of divece ",
                        style: TextStyle(color: white, fontSize: 17),
                      ),
                    ]),
                trailing: Column(
                  children: [
                    SizedBox(
                      height: smallSpacer + 2,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: white,
                    ),
                  ],
                ),
              ),
              CustomDivider(
                colorDivder: white.withOpacity(.3),
                thickness: 1,
              ),
              customRadio(
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
                  TextValue: "continue \$89",
                  backgroundColor: divider,
                  textColor: yellow,
                  width: 300,
                ),
              ),
              SizedBox(
                height: miniSpacer,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
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

  Widget customRadio(
      {required BuildContext context,
      String title = "test",
      required List<String> radioValues,
      required String groupValue}) {
    return SizedBox(
      height: radioValues.length > 4
          ? MediaQuery.of(context).size.height / 6.6
          : MediaQuery.of(context).size.height / 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: miniSpacer,
          ),
          Text(
            title.toUpperCase(),
            style: TextStyle(color: white),
          ),
          Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: List.generate(
                  radioValues.length,
                  (index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 4.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Radio(
                                  value: radioValues[index],
                                  activeColor: yellow,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    groupValue = value!;
                                    setState(() {});
                                  }),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              radioValues[index],
                              style: TextStyle(color: white),
                            ),
                          ],
                        ),
                      ))),
        ],
      ),
    );
  }
}
