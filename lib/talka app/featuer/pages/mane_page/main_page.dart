import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/featuer/pages/mane_page/widgets/body_staggredGrid.dart';
import 'package:app/talka%20app/featuer/pages/mane_page/widgets/custom_slider.dart';
import 'package:app/talka%20app/featuer/pages/mane_page/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  // int? imageDisplayIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: MainAppBar(scrollPosition: _scrollPosition),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            margin: EdgeInsets.all(0),
            child: Column(
              children: [
                CustomFlotingAppBar(
                  height: MediaQuery.sizeOf(context).height / 7,
                  flotingWidgetOnAppBar: CustomSlider(),
                ),
                CustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "توصيل الطعام",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "لا تشيل هم الجوع...طعام شراب,واجبات سريعة,اكل بيت,حلويات,ايسكريم...كله موجود ومن افخم الامكان ",
                              style: TextStyle(color: black.withOpacity(0.5)),
                            ),
                          ),
                          Image.asset(
                            "assets/talak_images/food_delivery.jpg",
                            height: 80,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                bodyStaggeredGrid()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
