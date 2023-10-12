import 'package:flutter/material.dart';

class TweenEx extends StatefulWidget {
  const TweenEx({super.key});

  @override
  State<TweenEx> createState() => _TweenExState();
}

class _TweenExState extends State<TweenEx> {
  @override
  Widget build(BuildContext context) {
    return  TweenAnimationBuilder(
      child: Container(
        child: Text("flutter bootcamp",style: TextStyle(color: Colors.red,fontSize: 30),),
      ),
      tween: Tween<double>(begin: 0.5,end: 1), duration: Duration(seconds: 3), builder: (ctx,value,x){
      return Container(
        margin: EdgeInsets.all(value*50),
        child: Opacity(opacity: value,child: x,)) ;
    });
  }
}