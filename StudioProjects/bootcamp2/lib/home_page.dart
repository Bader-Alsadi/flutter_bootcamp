import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first app"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text("inside Center",style: TextStyle(color: Colors.white),),
                  ),
                ))

          ],
        ),
        ElevatedButton(onPressed: (){}, child: Text("Login"))],
      )
    );
  }
}
