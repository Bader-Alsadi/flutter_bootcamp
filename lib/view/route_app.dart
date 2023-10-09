// import 'dart:js';

import 'package:flutter/material.dart';

class RouteApp extends StatefulWidget {
  RouteApp({super.key});

  @override
  State<RouteApp> createState() => _RouteAppState();
}

class _RouteAppState extends State<RouteApp> {
  var page_index = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    List<IconData> listIcon = [
      Icons.home,
      Icons.person,
      Icons.message,
      Icons.login,
    ];
    var size = MediaQuery.of(context).size  ;
    return  Container(
        width: size.width,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 135, 172, 199),
                  blurRadius: 20,
                  // spreadRadius: 10,
                  offset: Offset(0, -5))
            ]),
        child: Padding(
          padding:  EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(listIcon.length, (index) {
                return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: Column(
                    children: [
                      Icon(
                        listIcon[index],
                        color: index == page_index
                            ? Colors.blue[500]
                            : Colors.black54,
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      index == page_index
                          ? AnimatedContainer(
                              duration: Duration(microseconds: 500),
                              child: Container(
                                height: 3,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: index == page_index
                                        ? Colors.blue[500]
                                        : Colors.black54,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              })),
        ));
  }

  selectedTab(index) {
    setState(() {
      page_index = index;
    });
  }
}
