import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ex2 extends StatelessWidget {
  const Ex2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color:Colors.purple,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
              ),

              child: Center(),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
            ),
            CircleAvatar(
              radius: 40,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
              child: Center(child: Text("150%"),),
            ),
            Positioned(
              top: 300,
              child: Container(
                height: 170,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(40)
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: listRow(Sart: 1,End: 6,),

            ),
          ),
        ),
      ],
    );
  }
}

List<Widget> listRow ({required int Sart ,required int End}){
  List<Container> listCon = [];
  List<Widget> listRow =[];
  for(int i = Sart ; i<=End;i++){

    listCon.add( reContainer(te :"+"));
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
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 50,
      width: 50,
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text(te,style: TextStyle(color: Colors.white),),
      )
  );
}
