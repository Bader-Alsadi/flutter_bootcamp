import 'package:app/movie_app/core/Data/subscrption_page_data.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/cuntom_Elevated_button.dart';
import 'package:app/movie_app/core/widgets/custom_divider.dart';
import 'package:app/movie_app/core/widgets/custom_title_subtitle.dart';
import 'package:app/movie_app/core/widgets/customsubscrption_haed.dart';
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
            customSubcrptionValues(context),
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

  Row customSubcrptionValues(BuildContext context) {
    return Row(
      children: List.generate(
          listPaiment.length,
          (index) => Column(
                children: List.generate(
                    listPaiment[index].length,
                    (inde) => Container(
                          margin: EdgeInsets.only(top: miniSpacer),
                          width: MediaQuery.of(context).size.width / 3,
                          height: 60,
                          child: Column(
                            children: [
                              Text(
                                "${listPaiment[index][inde]["name"]}",
                                style: TextStyle(
                                    color: slsetcedIndex == index
                                        ? white
                                        : white.withOpacity(0.3)),
                              ),
                              SizedBox(
                                height: miniSpacer - 5,
                              ),
                              Text("${listPaiment[index][inde]["price"]}",
                                  style: TextStyle(
                                      color: slsetcedIndex == index
                                          ? yellow
                                          : yellow.withOpacity(0.3))),
                              Divider(
                                endIndent:
                                    (MediaQuery.of(context).size.width / 3) /
                                            2 -
                                        smallSpacer +
                                        5,
                                indent:
                                    (MediaQuery.of(context).size.width / 3) /
                                            2 -
                                        smallSpacer +
                                        5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )),
              )),
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
                      "test",
                      style: TextStyle(
                          color: slsetcedIndex == index ? black : white,
                          fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          slsetcedIndex == index ? yellow : primary,
                    ),
                  ),
                )));
  }
}
