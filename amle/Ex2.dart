import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ex2 extends StatelessWidget {
  const Ex2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("exer 2"),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Center(),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
                  child: Center(
                    child: Text("150%"),
                  ),
                ),
                Positioned(
                  top: 230,
                  child: Container(
                    height: 190,
                    width: 350,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.black,
                                    ),
                                    Column(
                                      children: [
                                        Text("150 %"),
                                        Text("test "),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.black,
                                    ),
                                    Column(
                                      children: [
                                        Text("150 %"),
                                        Text("test "),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.black,
                                    ),
                                    Column(
                                      children: [
                                        Text("150 %"),
                                        Text("test "),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.black,
                                    ),
                                    Column(
                                      children: [
                                        Text("150 %"),
                                        Text("test "),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
            Container(
              width: size.width,
              height: 200,
              margin: EdgeInsets.only(top: 130),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: listRow(
                  Sart: 1,
                  End: 6,
                ),
              ),
            ),
          ],
        ));
  }
}

List<Widget> listRow({required int Sart, required int End}) {
  List<Container> listCon = [];
  List<Widget> listRow = [];
  for (int i = Sart; i <= End; i++) {
    listCon.add(reContainer(te: "+"));
    if (i % 3 == 0) {
      listRow.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: listCon,
      ));
      listCon = [];
    }
  }

  return listRow;
}

Container reContainer({required String te}) {
  return Container(
      decoration: BoxDecoration(
        // shape: CircleBorder(side: BorderSide,eccentricity: 0.0),
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(30),
      ),
      height: 60,
      width: 60,
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text(
          te,
          style: TextStyle(color: Colors.white),
        ),
      ));
}
