import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_appbar_2.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_image_raduis.dart';
import 'package:app/talka%20app/core/widgets/tabbarContiner.dart';
import 'package:app/talka%20app/featuer/pages/card_page/widgets/custom_floating_contenier.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    int selectPage = 0;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              customAppBar2(
                title: "طلباتي",
              ),
              Positioned(
                top: 115,
                left: 5,
                child: Container(
                  width: 2 * 190,
                  margin: EdgeInsets.only(top: miniSpacer),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(50)),
                  child: TabBar(
                    physics: ScrollPhysics(),
                    indicatorColor: Colors.transparent,
                    controller: controller,
                    tabs: List.generate(
                      2,
                      (index) => InkWell(
                          onTap: () {
                            controller.animateTo(index);
                            selectPage = index;
                            setState(() {});
                          },
                          child: customTabbarContainer(
                              index: index, selectPage: selectPage)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: primary,
        body: TabBarView(controller: controller, children: [
          NewWidget(
            controller: controller,
          ),
          NewWidget(
            controller: controller,
          ),
        ]),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({super.key, required this.controller});
  TabController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomFlotingAppBar(
            height: 90,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: ListView.builder(
              itemBuilder: (context, index) => Stack(
                children: [
                  CustomContainer(
                      child: CustomFlotingContainer(
                    imageWidget: CutstomImageWithRaduis(
                      borderRAdiusValue: 35,
                      height: 60,
                      width: 60,
                    ),
                  )),
                  Positioned(
                    left: 25,
                    top: 25,
                    child: Icon(
                      Icons.cancel,
                      color: secondary,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
