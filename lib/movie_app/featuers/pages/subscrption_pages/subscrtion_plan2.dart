import 'package:app/movie_app/core/Data/buttom_Values.dart';
import 'package:app/movie_app/core/Data/subscrption_page_data.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/cuntom_Elevated_button.dart';
import 'package:app/movie_app/core/widgets/custom_divider.dart';
import 'package:app/movie_app/core/widgets/custom_text_and_triling.dart';
import 'package:app/movie_app/core/widgets/custom_title_subtitle.dart';
import 'package:app/movie_app/core/widgets/customsubscrption_haed.dart';
import 'package:flutter/material.dart';

class SubscrptionPlanpage2 extends StatefulWidget {
  SubscrptionPlanpage2({super.key});

  @override
  State<SubscrptionPlanpage2> createState() => _SubscrptionPlanpage2State();
}

class _SubscrptionPlanpage2State extends State<SubscrptionPlanpage2> {
  int slsetcedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: customAppBar(title: "cubscrption plan")),
      body: Container(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            customSubscrptionHeading(),
            SizedBox(
              height: smallSpacer,
            ),
            customButtomBar(context: context, height: 45),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: miniSpacer),
              child: Column(
                children: List.generate(
                    listPaiment[slsetcedIndex].length,
                    (index) => customTextAndTriling(
                          labelFild: listPaiment[slsetcedIndex][index]["name"]!,
                          triling: listPaiment[slsetcedIndex][index]["price"]!,
                        )),
              ),
            ),
            SizedBox(
              height: spacer,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: miniSpacer),
              child: customElevatedButton(
                navigator: customPlan,
                TextValue: "continue",
                backgroundColor: bottomColor,
                textColor: yellow,
                width: 380,
              ),
            ),
            SizedBox(
              height: smallSpacer,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: miniSpacer),
              child: customTitleSubtitle(
                tilte: "by sigrin up you to agree to our privcey",
                subtitle: "privecy and trems",
                subtitlecolor: yellow,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Row customButtomBar({required BuildContext context, double height = 80}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            3,
            (index) => SizedBox(
                  width: MediaQuery.of(context).size.width / 3 - miniSpacer,
                  height: height,
                  child: ElevatedButton(
                    onPressed: () {
                      // int crIndex = index;
                      slsetcedIndex = index;
                      setState(() {});
                    },
                    child: Text(
                      buttomValues[index].toUpperCase(),
                      style: TextStyle(
                          color: slsetcedIndex == index ? black : white,
                          fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          slsetcedIndex == index ? yellow : bottomColor,
                    ),
                  ),
                )));
  }
}
