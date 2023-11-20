import 'package:app/dya58_floor/entities/reg_course.dart';
import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:flutter/material.dart';

class AddCourseToStudentView extends StatefulWidget {
  AddCourseToStudentView(
      {super.key, required this.id, required this.departmentId});
  int id, departmentId;

  @override
  State<AddCourseToStudentView> createState() => _AddCourseToStudentViewState();
}

class _AddCourseToStudentViewState extends State<AddCourseToStudentView> {
  List<RegCourse> Courses = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add Course to student"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            onPressed: () async {
              await DBhelper.databse.regCourseDao.AddRegCourseList(Courses);
              Navigator.pop(context);
            },
            child: Text("add")),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: FutureBuilder(
              future: DBhelper.databse.courseDao
                  .getAllCoursebyDebID(widget.departmentId, widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Wrap(
                    spacing: 10,
                    children: snapshot.data!
                        .map((e) => InkWell(
                            onTap: () {
                              if (Courses.any(
                                  (element) => e.id == element.CourseId)) {
                                Courses.remove(e);
                              } else {
                                Courses.add(RegCourse(
                                    StudentId: widget.id, CourseId: e.id));
                              }
                              print(Courses);
                              setState(() {});
                            },
                            child: Chip(
                                backgroundColor: Courses.any(
                                        (element) => e.id == element.CourseId)
                                    ? secondry
                                    : primary,
                                label: Text(
                                  e.name!,
                                  style: TextStyle(
                                      color: Courses.any((element) =>
                                              e.id == element.CourseId)
                                          ? white
                                          : black),
                                ))))
                        .toList(),
                  );
                } else {
                  return Center(
                    child: Text("empty"),
                  );
                }
              }),
        ),
      ),
    );
  }
}
