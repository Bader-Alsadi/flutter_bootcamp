

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App3  extends StatelessWidget {
  const App3 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("first app"),
      ),
      body: SingleChildScrollView(child: Column(
        children:
        reContainer(number: 20),
      ),)
    );
  }
}

List<Container>reContainer ({required int number}){
  List<Container> listContainer=[];
  for(int i=0;i<number;i++)
    listContainer.add(Container(
      margin: EdgeInsets.all(10),
      width: 400,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3.5), // changes position of shadow
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage('assets/image/index.jpeg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "NAME : ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 26, 19, 19),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Bader Alsadi"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Jop : ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 26, 19, 19),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Progarmer"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(children: [
                        Text(
                          "Major : ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 19, 19),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("CS"),
                      ],)

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(onPressed: (){}, child: Text("Add")) ,
                  ),
                ],
              ),
            ],
          ),),

        ],
      ),
    ));
  return  listContainer;
}
