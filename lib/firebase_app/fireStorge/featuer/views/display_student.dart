import 'package:app/firebase_app/fireStorge/featuer/model/student_model.dart';
import 'package:app/firebase_app/fireStorge/featuer/modelviews/studendMV/studentVM.dart';
import 'package:app/firebase_app/fireStorge/featuer/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DispalyStudnet extends StatelessWidget {
  const DispalyStudnet({super.key});

  @override
  Widget build(BuildContext context) {
    final svm = Provider.of<StudentVM>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Icon(Icons.add_reaction_rounded)),
      ),
      body: Container(
          child: FutureBuilder(
              future: svm.faech(),
              builder: (context, snapshot) {
                if (!(snapshot.connectionState == ConnectionState.done)) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text("no data yet"),
                    );
                  } else {
                    List<Student> students = snapshot.data!;
                    return ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, Index) => ListTile(
                              title: Text(students[Index].name!),
                              subtitle: Text(students[Index].id!),
                            ));
                  }
                }
              })),
    );
  }
}
