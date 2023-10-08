import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("first app"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
                    child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      "inside Center",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
                child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "inside Center",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),

               Row(
                children: [
                  Expanded(

                      child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                    ),
                    child: Center(
                      child: Text(
                        "inside Center",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        "inside Center",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: Center(
                      child: Text(
                        "inside Center",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
                ],

            ),
          ],
        ));
  }
}
