import 'package:app/movie_app/core/Data/buttom_Values.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/cuntom_Elevated_button.dart';
import 'package:app/movie_app/core/widgets/custom_divider.dart';
import 'package:app/movie_app/core/widgets/custom_title_subtitle.dart';
import 'package:app/movie_app/core/widgets/customsubscrption_haed.dart';
import 'package:app/movie_app/featuers/pages/subscrption_pages/widgets/custom_subcrption.dart';
import 'package:flutter/material.dart';

class SubscrptionPlanpage extends StatefulWidget {
  SubscrptionPlanpage({super.key});
  @override
  State<SubscrptionPlanpage> createState() => SubscrptionPlanpageState();
}

class SubscrptionPlanpageState extends State<SubscrptionPlanpage> {
  int slsetcedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: white,
        ),
        backgroundColor: secondary,
        title: Text(
          "subscrption plan ".toUpperCase(),
          style: TextStyle(color: white),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomDivider(),
            customSubscrptionHeading(),
            SizedBox(
              height: smallSpacer,
            ),
            customButtomBar(context: context),
            SizedBox(
              height: miniSpacer,
            ),
            CustomSubcrpitionValue(slsetcedIndex: slsetcedIndex),
            SizedBox(
              height: spacer,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: smallSpacer),
              child: customElevatedButton(
                navigator: subscrption2,
                TextValue: "continue",
                backgroundColor: primary,
                width: 350,
              ),
            ),
            SizedBox(
              height: smallSpacer,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: smallSpacer),
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
                          slsetcedIndex == index ? yellow : primary,
                    ),
                  ),
                )));
  }
}
