import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

class TaskHier extends StatefulWidget {
  const TaskHier({super.key});

  @override
  State<TaskHier> createState() => _TaskHierState();
}

class _TaskHierState extends State<TaskHier> {
  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(
      appBar: AppBar(
        title: Text("hier"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body: SingleChildScrollView(
        child: 
        FutureBuilder(future: null, builder: (context,snapshot){
          if(snapshot.hasData){

            return ListView.builder(itemBuilder: (context,Index)=>ListTile()) ;
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        })
      ),
    );
  }
}