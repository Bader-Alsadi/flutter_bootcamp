import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Call extends StatelessWidget {
  const Call({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(onTap: (){
            Navigator.pushNamed(context, "chat");
          },child:  Text("chat"))
      // Center(
      //   child: ElevatedButton(onPressed: (){
      //     Navigator.pushNamed(context, "chat");
      //   }, child: Text("chat"),
      //   ),
      //     ),
        ],
      ),
    );
  }
}
