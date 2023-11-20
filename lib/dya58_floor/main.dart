import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/course/show_course.dart';
import 'package:app/dya58_floor/views/dashborad.dart';
import 'package:app/dya58_floor/views/department/show_dapartment.dart';
import 'package:app/dya58_floor/views/student_pahe/student_show.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBhelper.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'Material App',
      routes: {
        "student": (context) => StudentShow(),
        "department": (context) => DepartmentShow(),
        "course": (context) => CourseShow(),
      },
      home: DashboardPage(),
    );
  }
}

// Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             DBhelper.databse.studentDao.addStudent(Student(name: "bader"));
//             setState(() {});
//           },
//           child: Text("add"),
//         ),
//         appBar: AppBar(
//           title: const Text('Material App Bar'),
//         ),
//         body: FutureBuilder(
//             future: DBhelper.databse.departmentDao.getAllDepartment(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return DropdownButton(
//                     items: snapshot.data!
//                         .map((e) =>
//                             DropdownMenuItem(value: e.id, child: Text(e.name!)))
//                         .toList(),
//                     onChanged: (value) {});
//               } else {
//                 return DropdownButton(items: [], onChanged: (value) {});
//               }
//             }),
//       ),

// FutureBuilder(
//             future: DBhelper.databse.studentDao.getAllStudent(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) => ListTile(
//                           title: Text(snapshot.data![index].name!),
//                           trailing: SizedBox(
//                             width: MediaQuery.sizeOf(context).width * .2,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     DBhelper.databse.studentDao
//                                         .deleteStudentById(
//                                             snapshot.data![index].id!);
//                                     setState(() {});
//                                   },
//                                   child: Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     // snapshot.data![index]..name="cdc";
//                                     DBhelper.databse.studentDao.updateStudent(
//                                         Student(
//                                             id: snapshot.data![index].id,
//                                             name: "ali"));
//                                     setState(() {});
//                                   },
//                                   child: Icon(
//                                     Icons.edit,
//                                     color: Colors.green,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ));
//               } else {
//                 return Center(
//                   child: Text("empty"),
//                 );
//               }
//             }),
