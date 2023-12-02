import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:flutter/material.dart';

class Notfiction_page extends StatefulWidget {
  const Notfiction_page({super.key});

  @override
  State<Notfiction_page> createState() => _Notfiction_pageState();
}

class _Notfiction_pageState extends State<Notfiction_page> {
  TextEditingController noti_page = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "الاشعارات",
            style: title,
          ),
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
                      titleAlignment: ListTileTitleAlignment.top,
                      leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(65),
                          child: Image.asset(
                            'assets/placeholder.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
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
                              style: normalTextbold,
                            ),
                            Text(
                              "عندي مشكلة في لابتوب اريد منكم حله في اقرب فرصة",
                              style: normalText.copyWith(
                                  color: black.withOpacity(.5)),
                            ),
                            SizedBox(
                              height: spacer / 2,
                            ),
                            false
                                ? Text(
                                    "رد",
                                    style: normalText.copyWith(
                                        color: COLOR_PRIMARY),
                                  )
                                : TextFormField(
                                    controller: noti_page,
                                    decoration: getInputDecoration(
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.send_rounded,
                                          size: 15,
                                        ),
                                      ),
                                      hint: "رد",
                                      darkMode: isDarkMode(context),
                                      errorColor:
                                          Theme.of(context).colorScheme.error,
                                    )),
                            Container(
                              padding: EdgeInsets.all(HE_paddding),
                              decoration: BoxDecoration(
                                  color: COLOR_PRIMARY.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(noti_page.text,
                                  style: normalText.copyWith(
                                      color: black.withOpacity(.5))),
                            )
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
