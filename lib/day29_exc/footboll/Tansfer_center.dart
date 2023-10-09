import 'package:app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tran extends StatefulWidget {
  const Tran({super.key});

  @override
  State<Tran> createState() => _TranState();
}

class _TranState extends State<Tran> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(105),
          child: AppBar(
            backgroundColor: black,
            title: Container(
              padding: EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                "Transfer Centre",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30, color: primary),
              ),
            ),
          ),
        ),
        body: getBody(),
        bottomNavigationBar: getFooter(),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    var Padding = size.width / 15;
    return SingleChildScrollView(
      child: Container(
          width: size.width,
          padding: EdgeInsets.all(Padding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All transfer",
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Filter", style: TextStyle(color: black)),
                          WidgetSpan(child: Icon(Icons.arrow_drop_down)),
                          TextSpan(
                              text: "Sort", style: TextStyle(color: black)),
                          WidgetSpan(child: Icon(Icons.arrow_drop_down)),
                        ]))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                    // direction: Axis.vertical,
                    children: List.generate(
                        4,
                        (index) => Column(
                              children: [
                                Container(
                                  width: size.width,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color: Colors.pink.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(children: [
                                    Container(
                                      height: 154,
                                      padding: EdgeInsets.only(
                                          top: Padding,
                                          left: Padding - 20,
                                          right: Padding - 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Today"),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 25,
                                                    backgroundImage: AssetImage(
                                                        "assets/image/index.jpeg"),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("Neymar Da Silva"),
                                                ],
                                              ),
                                              Text("Dismiss"),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "PSG  ",
                                                      style: TextStyle(
                                                          color: black)),
                                                  WidgetSpan(
                                                    child: CircleAvatar(
                                                      radius: 12,
                                                      backgroundImage: AssetImage(
                                                          "assets/image/index.jpeg"),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                              Icon(Icons.arrow_forward),
                                              RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "PSG  ",
                                                      style: TextStyle(
                                                          color: black)),
                                                  WidgetSpan(
                                                    child: CircleAvatar(
                                                      radius: 12,
                                                      backgroundImage: AssetImage(
                                                          "assets/image/index.jpeg"),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            height: 50,
                                            width: size.width - (Padding + 36),
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Text(
                                              "Free \$86M contract Aug 2023 - Jun 2025 Market value \$50M ",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )))
              ],
            ),
          )),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    var Padding = size.width / 15;
    List<IconData> listic = [
      Icons.foundation_outlined,
      Icons.list_alt_rounded,
      Icons.cabin,
      Icons.star_border_outlined,
    ];

    return Container(
        padding: EdgeInsets.all(Padding),
        decoration: BoxDecoration(color: primary, boxShadow: [
          BoxShadow(
              offset: Offset(0, -1),
              blurRadius: 3,
              spreadRadius: 3,
              color: black.withOpacity(0.2))
        ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                4,
                (index) => Icon(
                      listic[index],
                      color: Colors.black54,
                    ))));
  }
}
