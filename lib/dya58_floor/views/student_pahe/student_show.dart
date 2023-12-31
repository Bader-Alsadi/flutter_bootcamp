import 'package:app/dya58_floor/helper/db_hleper.dart';
import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/dya58_floor/views/student_pahe/add_course_to_student.dart';
import 'package:app/dya58_floor/views/student_pahe/add_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentShow extends StatefulWidget {
  const StudentShow({super.key});

  @override
  State<StudentShow> createState() => _StudentShowState();
}

class _StudentShowState extends State<StudentShow> {
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
                return AddStudentView();
              }));
              setState(() {});
            },
            child: Text("Add New Student")),
      ),
      appBar: AppBar(
        title: Text("Studnet show"),
      ),
      body: FutureBuilder(
          future: DBhelper.databse.studentDao.getAllStudentbyDebId(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, Index) => Slidable(
                        child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 70,
                            // padding: const EdgeInsets.all(15.0),
                            child: Builder(builder: (context) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 200),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 2),
                                                blurRadius: 40,
                                                color: black.withOpacity(0.2),
                                                // spreadRadius: 3,
                                              ),
                                            ],
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(radio),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/svg_image/student_reg/student.svg",
                                                height: 70,
                                                colorFilter: ColorFilter.mode(
                                                    secondry, BlendMode.srcIn),
                                              ),
                                              Text(
                                                "${snapshot.data![Index].name!} : ${snapshot.data![Index].id!}",
                                                style: subTitle,
                                              ),
                                              Divider(
                                                endIndent: 20,
                                                thickness: 1,
                                                indent: 20,
                                                color:
                                                    secondry.withOpacity(0.3),
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "${snapshot.data![Index].department_name} :",
                                                    style: subTitle),
                                                TextSpan(
                                                    text: snapshot.data![Index]
                                                            .active!
                                                        ? " active"
                                                        : " notactive",
                                                    style: subTitle.copyWith(
                                                        color: secondry))
                                              ])),
                                              Text(
                                                  "Emale : ${snapshot.data![Index].email!}"),
                                              Text(
                                                  "phoneNo : ${snapshot.data![Index].phoneNo!}"),
                                              Card(
                                                child: FutureBuilder(
                                                    future: DBhelper
                                                        .databse.courseDao
                                                        .getAllCoursebyStudentid(
                                                            snapshot
                                                                .data![Index]
                                                                .id!),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Wrap(
                                                          spacing: 10,
                                                          children: snapshot
                                                              .data!
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
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: secondry,
                                    child: SvgPicture.asset(
                                      "assets/svg_image/student_reg/student.svg",
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
                                    snapshot.data![Index].department_name!,
                                  ),
                                ),
                              );
                            })),
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
                                int? s = await DBhelper.databse.studentDao
                                    .deleteStudent(snapshot.data![Index]);
                                print("delete $s");
                                setState(() {});
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: white,
                              icon: Icons.delete,
                              label: 'delete',
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AddStudentView(
                                    student: snapshot.data![Index],
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
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) async {
                                await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AddCourseToStudentView(
                                      id: snapshot.data![Index].id!,
                                      departmentId:
                                          snapshot.data![Index].depratmentId!);
                                }));
                                setState(() {});
                              },
                              backgroundColor: Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.countertops_sharp,
                              label: 'Add Course',
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
