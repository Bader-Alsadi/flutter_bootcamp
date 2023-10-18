
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/widgets/coustom_abb_bar.dart';
import 'package:app/widgets/cuntom_Elevated_button.dart';
import 'package:flutter/material.dart';

class PaymentMathod extends StatefulWidget {
  const PaymentMathod({super.key});

  @override
  State<PaymentMathod> createState() => _PaymentMathodState();
}

class _PaymentMathodState extends State<PaymentMathod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: customAppBar(title: "payment mathod")),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/image/movise/movies10.jpg",
                    ),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        black.withOpacity(0.7), BlendMode.darken))),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: miniSpacer),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Card number",
                        style: TextStyle(color: white),
                      ),
                      Icon(
                        Icons.sd_card_outlined,
                        color: yellow,
                      )
                    ],
                  ),
                  SizedBox(
                    height: miniSpacer,
                  ),
                  Container(
                    padding: EdgeInsets.all(miniSpacer - 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: white.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none)),
                  ),
                  Row(
                    children: [
                      coustomSmallTextFiled(context, headText: "Expier Data"),
                      SizedBox(
                        width: miniSpacer,
                      ),
                      coustomSmallTextFiled(context, headText: "CVV/CVC"),
                    ],
                  ),
                  SizedBox(
                    height: spacer,
                  ),
                  customElevatedButton(
                    TextValue: "pay now",
                    textColor: yellow,
                    backgroundColor: divider,
                    width: MediaQuery.of(context).size.width / 1.1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column coustomSmallTextFiled(BuildContext context,
      {required String headText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: smallSpacer,
        ),
        Text(
          headText,
          style: TextStyle(color: white),
        ),
        SizedBox(
          height: miniSpacer,
        ),
        Container(
          padding: EdgeInsets.all(miniSpacer - 5),
          decoration: BoxDecoration(
            border: Border.all(color: white.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextFormField(
                decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none)),
          ),
        ),
      ],
    );
  }
}
