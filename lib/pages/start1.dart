
import 'package:app/Data/start_page_data.dart';
import 'package:app/routeNames.dart';
import 'package:app/theme/colors.dart';
import 'package:app/widgets/started_page.dart';
import 'package:flutter/material.dart';

class Start1 extends StatefulWidget {
  Start1({super.key});
  static String route = startPage;

  @override
  State<Start1> createState() => _Start1State();
}

class _Start1State extends State<Start1> {
  PageController pageController = PageController();

  int selsctePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
          PageView(
              controller: pageController,
              onPageChanged: (int page) {
                selsctePage = page;

                setState(() {});
              },
              children: List.generate(
                  startPageData.length,
                  (index) => StartedPage(
                        pageData: startPageData[index],
                      ))),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            left: MediaQuery.of(context).size.width / 10,
            child: Container(
              width: 75,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    startPageData.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 15,
                      width: index == selsctePage ? 30 : 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.5),
                          color: index == selsctePage ? yellow : white),
                    ),
                  )),
            ),
          ),
          selsctePage == startPageData.length - 1
              ? Positioned(
                  top: MediaQuery.of(context).size.height - 155,
                  left: MediaQuery.of(context).size.width / 1.3,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, startCreatAncouuntPage);
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "skip  ",
                          style: TextStyle(
                            color: white,
                            fontSize: 20,
                          )),
                      WidgetSpan(
                          child: Icon(
                        Icons.arrow_forward,
                        color: white,
                      ))
                    ])),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
