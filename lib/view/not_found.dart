import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Color.fromARGB(255, 247, 246, 246),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Icon(
                Icons.arrow_back,
                color: secondary,
              ),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("back", style: TextStyle(color: secondary))),
          backgroundColor: primary,
        ),
      ),
      body: Center(
        child: Image.asset("assets/image/images.png"),
      ),
    );
      
    
  }
}