// import 'package:flutter/cupertino.dart';
import 'package:app/theme/colors.dart';
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
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Container(
                    height: size.height / 3,
                    width: size.width,
                    color: Colors.blue[300],
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: white.withOpacity(0.3),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: white,
                  child: Center(
                    child: Text("150%"),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    height: 190,
                    width: 350,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          2,
                          (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                2,
                                (index) => ButtonBar(children: [
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundColor: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 80,
                                        child: ListTile(
                                          title: Text("150 %"),
                                          subtitle: Text("Test"),
                                        ),
                                      ),
                                    ])),
                          ),
                        )),
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
  List<Widget> listCon = [];
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

Widget reContainer({required String te}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        child: Text("+"),
      ),
      SizedBox(
        height: 10,
      ),
      Text("Test")
    ],
  );
}
