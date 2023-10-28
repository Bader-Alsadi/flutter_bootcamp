import 'package:app/movie_app/core/Data/category_payment_data.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/cuntom_Elevated_button.dart';
import 'package:app/movie_app/featuers/pages/category/widgets/custom_expansionpanel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryPayment extends StatefulWidget {
  const CategoryPayment({super.key});

  @override
  State<CategoryPayment> createState() => _CategoryPaymentState();
}

class _CategoryPaymentState extends State<CategoryPayment> {
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: customAppBar(title: "category")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(miniSpacer),
          height: MediaQuery.sizeOf(context).height - 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customPaymentMathodSlider(context),
              customExpansionpanel(
                selectindex: selectindex,
              ),
              SizedBox(
                height: smallSpacer,
              ),
              customElevatedButton(
                TextValue: "add new card",
                textColor: yellow,
                backgroundColor: bottomColor,
              ),
              Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "total :"),
                TextSpan(text: "\$ 549\n")
              ])),
              customElevatedButton(
                navigator: mySubscption,
                TextValue: "pay and confirem",
                textColor: yellow,
                backgroundColor: bottomColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox customPaymentMathodSlider(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 4,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
                  horizontal: miniSpacer, vertical: smallSpacer)
              .copyWith(bottom: spacer),
          itemCount: dataCategotyPayment.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: miniSpacer - 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        selectindex = index;
                        setState(() {});
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              dataCategotyPayment[index]["image"],
                              opacity: AlwaysStoppedAnimation(
                                  selectindex == index ? 0.4 : 1),
                              height: 90,
                              width: 140,
                              fit: BoxFit.fill,
                            ),
                          ),
                          selectindex == index
                              ? FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: yellow,
                                  size: 40,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Text(dataCategotyPayment[index]["title"]),
                  ],
                ),
              )),
    );
  }
}
