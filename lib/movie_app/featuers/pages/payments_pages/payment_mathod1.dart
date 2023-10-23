import 'package:app/movie_app/core/Data/data_textfield_paymatho.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/custom_text_and_triling.dart';
import 'package:flutter/material.dart';

class PlanMathod1 extends StatefulWidget {
  PlanMathod1({super.key});

  @override
  State<PlanMathod1> createState() => _PlanMathod1State();
}

class _PlanMathod1State extends State<PlanMathod1> {
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
                      labelFild: dataTextfieldPaymatho[index][0],
                      triling: dataTextfieldPaymatho[index][1]),
                ),
              ),
            RadioListTile(value: true, groupValue: true, onChanged: (value){

            },
            title: Text,
            )
            ],
          ),
        ),
      ),
    );
  }
}
