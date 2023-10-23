import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/custom_text_fild_wit_text.dart';
import 'package:flutter/material.dart';

class PlanMathod1 extends StatefulWidget {
  const PlanMathod1({super.key});

  @override
  State<PlanMathod1> createState() => _PlanMathod1State();
}

class _PlanMathod1State extends State<PlanMathod1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(miniSpacer),
      child: Column(
        children: [
          SizedBox(
            height: spacer,
          ),
          Text(
            "choose your plan mathod".toUpperCase(),
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
            
          ),
          customTextFildwithtext(labelFild: "Duration",suffixIcon: "15 Days"),
          customTextFildwithtext(labelFild: "Duration",suffixIcon: "15 Days"),
          customTextFildwithtext(labelFild: "Duration",suffixIcon: "15 Days"),
          customTextFildwithtext(labelFild: "Duration",suffixIcon: "15 Days"),
          SizedBox(height: spacer,),

        ],
      ),
    );
  }
}
