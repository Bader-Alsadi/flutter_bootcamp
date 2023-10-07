import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Clulcet extends StatelessWidget {
  const Clulcet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("first app"),
        ),
        body:
      Column(
          children: [
                 Container(
                  height: 315,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                ),
            Expanded(
                flex: 2,
                child: Column(

                  mainAxisAlignment:   MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex:2,
                        child: Row(
                          mainAxisAlignment:   MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: listRow(Sart: 1,End: 9),
                            ),
                            Column(

                              children: [
                                reContainer(te: "+"),
                                reContainer(te:"-"),
                                reContainer(te:"*"),
                              ],
                            ),
                          ],
                        ),
                      ),

                    Expanded(child: Row(
                      mainAxisAlignment:   MainAxisAlignment.spaceEvenly,
                      children: [
                        reContainer(te: "C"),
                        reContainer(te:"0"),
                        reContainer(te:"="),
                        reContainer(te:"/"),
                      ],
                    ))
                  ],
                )),
          ],
        )

    );
  }
}

List<Row> listRow ({required int Sart ,required int End}){
  List<Container> listCon = [];
  List<Row> listRow =[];
  for(int i = Sart ; i<=End;i++){

    listCon.add( reContainer(te: i.toString()));
    if(i%3==0)
      {
        listRow.add(Row(children: listCon,));
        listCon = [];
      }
  }

  return listRow;
}

Container reContainer ({required String te}){
  return Container(
      decoration: BoxDecoration(
        // shape: CircleBorder(side: BorderSide,eccentricity: 0.0),
        color: Colors.orange,
        borderRadius: BorderRadius.circular(40),
      ),
      height: 80,
      width: 75,
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text(te,style: TextStyle(color: Colors.white),),
      )
  );
}
