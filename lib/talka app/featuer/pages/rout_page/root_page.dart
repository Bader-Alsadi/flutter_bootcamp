import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/talka%20app/featuer/pages/account_page/account_page.dart';
import 'package:app/talka%20app/featuer/pages/card_page/card_page.dart';
import 'package:app/talka%20app/featuer/pages/favorite_page/favorite_page.dart';
import 'package:app/talka%20app/featuer/pages/mane_page/main_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: white,
        animationDuration: Duration(milliseconds: 1000),
        selectedIndex: selectePage,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "الرئسية"),
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
          NavigationDestination(icon: Icon(Icons.home), label: "السلة"),
          NavigationDestination(icon: Icon(Icons.home), label: "المفظلة"),
          NavigationDestination(icon: Icon(Icons.person), label: "الحساب")
        ],
        onDestinationSelected: (index) {
          selectePage = index;
          setState(() {});
        },
      ),
      body: [
        MainPage(),
        MainPage(),
        CardPage(),
        FavoritePage(),
        AccountPage()
      ][selectePage],
    );
  }
}
