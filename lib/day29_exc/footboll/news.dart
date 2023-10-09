import 'package:app/day29_exc/footboll/homePag.dart';
import 'package:app/day29_exc/footboll/news_.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(105),
          child: AppBar(
            backgroundColor: primary,
            title: Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "News",
                style: TextStyle(color: black, fontSize: 20),
              ),
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.values[0],
              indicatorWeight: 4,
              indicatorColor: black,
              tabs: [
                Tab(
                  child: Text(
                    "for you",
                    style: TextStyle(color: black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Lstest",
                    style: TextStyle(color: black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Transfers",
                    style: TextStyle(color: black),
                  ),
                ),
                Tab(
                  child: Text("Leagust", style: TextStyle(color: black)),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [NewPage(), NewPage(), NewPage(), NewPage()],
        ),
      ),
    ));
  }
}
