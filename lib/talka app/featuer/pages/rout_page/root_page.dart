import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/talka%20app/core/data/rote_data.dart';
import 'package:app/talka%20app/core/widgets/custom_Float_button.dart';
import 'package:app/talka%20app/featuer/pages/account_page/account_page.dart';
import 'package:app/talka%20app/featuer/pages/card_page/card_page.dart';
import 'package:app/talka%20app/featuer/pages/favorite_page/favorite_page.dart';
import 'package:app/talka%20app/featuer/pages/mane_page/main_page.dart';
import 'package:app/talka%20app/featuer/pages/myorder/myorder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  List<AnimationController>? _controllers;
  bool firstRun = false;
  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
        5,
        (index) => AnimationController(
              vsync: this,
            ));
    AnimationController(
      vsync: this,
    );
  }

  int selectePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: customFlotingButton(),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: white,
        animationDuration: Duration(milliseconds: 1000),
        selectedIndex: selectePage,
        destinations: List.generate(
          lables.length,
          (index) => CustomAnimtionItmeBar(
              index: index,
              path2: paths_2[index],
              label: lables[index],
              controller: _controllers![index],
              lottiePath: paths[index]),
        ),
        onDestinationSelected: (inde) {
          print(_controllers![inde].status);
          if (_controllers![inde].status == AnimationStatus.completed) {
            _controllers![inde].repeat();
            _controllers![inde].forward();
          }

          selectePage = inde;
          setState(() {});
        },
      ),
      body: [
        MainPage(),
        OrderPage(),
        CardPage(),
        FavoritePage(),
        AccountPage()
      ][selectePage],
    );
  }

  NavigationDestination CustomAnimtionItmeBar(
      {required String label,
      required int index,
      required String path2,
      required String lottiePath,
      required AnimationController controller}) {
    return NavigationDestination(
        icon: index != selectePage
            ? SvgPicture.asset(path2)
            : Lottie.asset(
                lottiePath,
                controller: controller,
                height: 40,
                width: 40,
                onLoaded: (composition) {
                  controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
        label: label);
  }
}
