import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/featuer/pages/mane_page/widgets/custom_slider.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // int? imageDisplayIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(89),
        child: Container(
          color: secondary,
          
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(0),
          child: Column(
            children: [
            CustomFlotingAppBar(flotingWidgetOnAppBar: CustomSlider(),),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: smallSpacer - 10, vertical: smallSpacer),
                padding: EdgeInsets.symmetric(
                    vertical: miniSpacer + 5, horizontal: miniSpacer),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(14)),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "توصيل الطعام",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "لا تشيل هم الجوع...طعام شراب,واجبات سريعة,اكل بيت,حلويات,ايسكريم...كله موجود ومن افخم الامكان ",
                            style: TextStyle(color: black.withOpacity(0.7)),
                          ),
                        ),
                        Icon(
                          Icons.access_alarm,
                          size: 50,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  child: Wrap(
                runSpacing: miniSpacer + 5,
                direction: Axis.horizontal,
                children: List.generate(
                  6,
                  (index) => Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    width:
                        MediaQuery.sizeOf(context).width / 2 - (miniSpacer * 3),
                    margin: EdgeInsets.symmetric(horizontal: miniSpacer - 2),
                    padding: EdgeInsets.all(miniSpacer),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "توصيل بلاس",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          " تشيل هم الجوع...طعام شراب,واجبات سريعة,اكل بيت,حلويات,ايسكريم...كله موجود ومن افخم الامكان ",
                          softWrap: true,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.abc,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
