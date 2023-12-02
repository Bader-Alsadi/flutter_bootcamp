import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/image_crical.dart';
import 'package:app/services_provider/featuer/view/profile_page/profile_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSliderSP extends StatelessWidget {
  const CustomSliderSP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 2,
        itemBuilder: (context, index, _) => Card(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: HE_paddding),
              child: Column(
                children: [
                  ListTile(
                    leading: ImageCrical(
                      size: Size(60, 60),
                    ),
                    title: Text(
                      "بدر السعدي",
                      style: normalTextbold,
                    ),
                    subtitle: Text("مبرمج",
                        style:
                            normalText.copyWith(color: black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: customButtomElev(
                        padding: 0,
                        lable: 'الملف الشخصي',
                        backColor: COLOR_PRIMARY.withOpacity(0.6),
                        onPressedFun: () {
                          Navigator.pushReplacementNamed(
                              context, ProfilePage.ROUTE);
                        }),
                  )
                ],
              ),
            )),
        options: CarouselOptions(
          height: MediaQuery.sizeOf(context).height * .20,
        ));
  }
}
