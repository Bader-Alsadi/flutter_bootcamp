import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/services_provider/core/widgets/custom_heda.dart';
import 'package:flutter/material.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});
   static const String ROUTE ="add_order";

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  final GlobalKey<FormState> FormKey = GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: COLOR_PRIMARY.withOpacity(.8),
          title: Text(
            "تسجيل",
            style: title.copyWith(color: white),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
          child: Form(
            key: FormKey,
            autovalidateMode: _validate,
            child: ListView(
              children: [
                customHeadingSP(
                  head: 'تسجيل كـ مزود خدمة',
                ),
                SizedBox(
                  height: spacer * 1.5,
                ),
                Customfiled(lable: "المهنة", validate: validateCareer),
                Customfiled(
                  lable: "تفاصيل",
                  validate: null,
                  maxLines: 5,
                ),
                customButtomElev(
                  lable: 'حفظ',
                  backColor: COLOR_PRIMARY,
                  onPressedFun: () {
                    if (FormKey.currentState!.validate()) return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
