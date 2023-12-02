import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_image.dart';
import 'package:app/services_provider/core/widgets/image_crical.dart';
import 'package:app/services_provider/featuer/view/profile_page/widgets/widget_use.dart';
import 'package:flutter/material.dart';

class OrderSPage extends StatefulWidget {
  const OrderSPage({super.key});
  static const String ROUTE ="orders_pahe";

  @override
  State<OrderSPage> createState() => _OrderSPageState();
}

class _OrderSPageState extends State<OrderSPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: COLOR_PRIMARY.withOpacity(.6),
          title: Text(
            "طلابات",
            style: title.copyWith(color: white),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
          child: ListView.builder(
              itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: HE_paddding,
                    ).copyWith(bottom: 10, right: 0),
                    child: ListTile(
                      onTap: () {
                        showBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                    gradient:
                                        LinearGradient(colors: gradientColors)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: spacer / 2,
                                    ),
                                    ImageCrical(
                                      size: Size(100, 100),
                                    ),
                                    SizedBox(
                                      height: spacer / 2,
                                    ),
                                    Text(
                                      "بدر السعدي",
                                      style: normalText,
                                    ),
                                    Text(
                                      "سباك",
                                      style: normalText.copyWith(
                                          color: black.withOpacity(0.5)),
                                    ),
                                    SizedBox(
                                      height: spaser / 2,
                                    ),
                                    CustomHaedValue(
                                      head: "رقم الهاتف :  ",
                                      value: "774541450",
                                    ),
                                    SizedBox(
                                      height: spaser / 2,
                                    ),
                                    CustomHaedValue(
                                      head: "الايميل:  ",
                                      value: "baderSaleh@gmaile.com",
                                    ),
                                    SizedBox(
                                      height: spaser / 2,
                                    ),
                                    CustomHaedValue(
                                      head: "الموقع:  ",
                                      value: "وادي بن علي",
                                    ),
                                    SizedBox(
                                      height: spaser / 2,
                                    ),
                                    Custom_about(
                                        textValue:
                                            "لبخشيستر ءىرىهخسثثتر يبتثهسخبجت يءبرىثهسخرىجشيثتب ثيلتث جيل"),
                                    SizedBox(
                                      height: spaser / 2,
                                    ),
                                    customButtomElev(
                                      padding: 0,
                                      lable: 'اختيار صورة للمهنة',
                                      backColor: COLOR_THIRD,
                                      onPressedFun: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Card(
                                                    child: customImage(),
                                                  ),
                                                ));
                                      },
                                    ),
                                    SizedBox(
                                      height: spacer,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customButtomElev(
                                          padding: 0,
                                          lable: 'قبول',
                                          backColor: COLOR_THIRD,
                                        ),
                                        SizedBox(
                                          width: spacer / 2,
                                        ),
                                        customButtomElev(
                                          padding: 0,
                                          lable: 'رفض',
                                          backColor: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      titleAlignment: ListTileTitleAlignment.top,
                      leading: ImageCrical(
                        size: Size(45, 45),
                      ),
                      title: Container(
                        padding: EdgeInsets.all(HE_paddding),
                        decoration: BoxDecoration(
                            color: COLOR_PRIMARY.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "بدر السعدي",
                              style: normalTextbold.copyWith(color: white),
                            ),
                            Text(
                              "منهدس",
                              style: normalText.copyWith(
                                  color: black.withOpacity(.5)),
                            ),
                            SizedBox(
                              height: spacer / 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              itemCount: 3),
        ),
      ),
    );
  }
}
