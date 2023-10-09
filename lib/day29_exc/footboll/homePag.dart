import 'package:app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageHomeF extends StatefulWidget {
  const PageHomeF({super.key});

  @override
  State<PageHomeF> createState() => _PageHomeFState();
}

class _PageHomeFState extends State<PageHomeF> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(105),
          child: getAppBar(),
        ),
        bottomNavigationBar: getFooter(),
        body: getBooy(),
      ),
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
        decoration: BoxDecoration(
            color: primary,
            boxShadow: [BoxShadow(offset: Offset(0, -1), blurRadius: 1)]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                4,
                (index) => Icon(
                      listic[index],
                      color: Colors.black,
                    ))));
  }

  Widget getAppBar() {
    return Container(
      decoration: BoxDecoration(color: primary, boxShadow: [
        BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 2,
        )
      ]),
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              right: MediaQuery.of(context).size.width / 15,
              top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back),
              Text("Matches"),
              Icon(Icons.hourglass_full),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 30,
              right: MediaQuery.of(context).size.width / 30,
              top: 10,
              bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => ElevatedButton(
                onPressed: null,
                child: Text("Button"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget getBooy() {
    var size = MediaQuery.of(context).size;
    var Padding = size.width / 15;

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 150,
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("hi footbol hfsdiufhasliu hdfvusdihfausdi"),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text("Button"),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.all(Padding - 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Suggestd match",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("dfjhsdjifolhaei;owrhfqwierouhfewuihferwqiufh"),
                    SizedBox(
                      height: 20,
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
                                          height: 135,
                                          padding: EdgeInsets.all(Padding),
                                          // width: size.width,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        "assets/image/index.jpeg"),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("Alathad"),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Home",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text("9:00 AM"),
                                                  Container(
                                                    width: 80,
                                                    height: 50,
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.red
                                                          .withOpacity(0.7),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "it has Strted yet",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        "assets/image/index.jpeg"),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("Alathad"),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Home",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      Divider(
                                        thickness: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text("Bundesgin",
                                              style: TextStyle(fontSize: 14)),
                                          Icon(
                                            Icons.sports_football,
                                            color: Colors.grey[700],
                                          ),
                                          SizedBox(
                                            width: size.width / 5,
                                          ),
                                          Icon(
                                            Icons.home,
                                            color: Colors.grey[700],
                                          ),
                                          Text(
                                            "Camp Nou",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              )),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
