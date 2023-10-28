import 'package:app/movie_app/core/Data/dataRadioTile.dart';
import 'package:app/movie_app/core/Data/data_textfield_paymatho.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/cuntom_Elevated_button.dart';
import 'package:app/movie_app/core/widgets/custom_text_and_triling.dart';
import 'package:flutter/material.dart';

class PlanMathod1 extends StatefulWidget {
  PlanMathod1({super.key});

  @override
  State<PlanMathod1> createState() => _PlanMathod1State();
}

class _PlanMathod1State extends State<PlanMathod1> {
  String groubValue = dataRadioTile[0]["title"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: customAppBar(
          title: "paymant mathod",
          elevation: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(smallSpacer - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "choose your plan mathod".toUpperCase(),
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              ),
              Column(
                children: List.generate(
                  dataTextfieldPaymatho.length,
                  (index) => customTextAndTriling(
                      islast: dataRadioTile.length == index ? true : false,
                      labelFild: dataTextfieldPaymatho[index][0],
                      triling: dataTextfieldPaymatho[index][1]),
                ),
              ),
              for (int i = 0; i < 3; i++)
                customRadioTie(
                  islast: i == 2 ? true : false,
                  title: dataRadioTile[i]["title"],
                  subTitle: dataRadioTile[i]["subTitle"],
                  image: dataRadioTile[i]["image"],
                  value: dataRadioTile[i]["title"],
                ),
              SizedBox(
                height: spacer,
              ),
              customElevatedButton(
                navigator: payment1,
                width: MediaQuery.sizeOf(context).width - smallSpacer,
                backgroundColor: bottomColor,
                TextValue: "continue \$55",
                textColor: yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column customRadioTie(
      {String value = "",
      String title = "",
      String subTitle = "",
      required String image,
      bool islast = false}) {
    return Column(
      children: [
        SizedBox(
          height: smallSpacer - 5,
        ),
        RadioListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          value: value,
          groupValue: groubValue,
          onChanged: (value) {
            groubValue = value!;
            setState(() {});
          },
          activeColor: yellow,
          title: Text(
            title,
            
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(subTitle),
          secondary: Image.asset(
            image,
            height: 25,
            width: 30,
          ),
        ),
        Divider(
          color: islast ? Colors.transparent : white.withOpacity(0.3),
        )
      ],
    );
  }
}
