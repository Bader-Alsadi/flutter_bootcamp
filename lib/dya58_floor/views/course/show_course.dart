import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/course/add_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseShow extends StatefulWidget {
  const CourseShow({super.key});

  @override
  State<CourseShow> createState() => _CourseShowState();
}

class _CourseShowState extends State<CourseShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            onPressed: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return AddCourseView();
              }));
              setState(() {});
            },
            child: Text("Add New Course")),
      ),
      appBar: AppBar(
        title: Text("Course show"),
      ),
      body: FutureBuilder(
          future: DBhelper.databse.courseDao.getAllCourse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, Index) => Slidable(
                        child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 70,
                            // padding: const EdgeInsets.all(15.0),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 200),
                                          child: Center(
                                            child: Card(
                                              child: FutureBuilder(
                                                  future: DBhelper
                                                      .databse.studentDao
                                                      .getAllCoursebyStudentid(
                                                          snapshot.data![Index]
                                                              .id!),
                                                  builder: (context, snapshot) {
                                                    if (!snapshot
                                                        .data!.isEmpty) {
                                                      return Wrap(
                                                        spacing: 10,
                                                        children: snapshot.data!
                                                            .map((e) => Chip(
                                                                backgroundColor:
                                                                    primary,
                                                                label: Text(
                                                                  e.name!,
                                                                  style: TextStyle(
                                                                      color:
                                                                          white),
                                                                )))
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
                                        ));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: secondry,
                                  child: SvgPicture.asset(
                                    "assets/svg_image/student_reg/coures.svg",
                                    height: 30,
                                    colorFilter: ColorFilter.mode(
                                        white, BlendMode.srcIn),
                                  ),
                                ),
                                title: Text(
                                  snapshot.data![Index].name!,
                                  style: subTitle,
                                ),
                                subtitle: Text(
                                  snapshot.data![Index].hours.toString(),
                                  style: subTitle,
                                ),
                              ),
                            )),
                        // Specify a key if the
                        //cSlidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const BehindMotion(),

                          // A pane can dismiss the Slidable.
                          dismissible: DismissiblePane(onDismissed: () {}),

                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: (context) async {
                                await DBhelper.databse.courseDao
                                    .deleteCourseById(
                                        snapshot.data![Index].id!);
                                // setState(() {});
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: white,
                              icon: Icons.delete,
                              label: 'more',
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AddCourseView(
                                    course: snapshot.data![Index],
                                  );
                                }));
                                setState(() {});
                              },
                              backgroundColor: secondry,
                              foregroundColor: white,
                              icon: Icons.share,
                              label: 'Edit',
                            ),
                          ],
                        ),
                      ));
            } else {
              return Center(
                child: Text("empty"),
              );
            }
          }),
    );
  }
}
