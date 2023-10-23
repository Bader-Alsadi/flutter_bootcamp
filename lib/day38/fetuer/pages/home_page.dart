import 'package:app/day38/core/widgits/customTextFiled.dart';
import 'package:app/day38/core/widgits/custom_rich_text.dart';
import 'package:app/day38/fetuer/control/semaster_control.dart';

import 'package:app/day38/fetuer/models/semester.dart';
import 'package:app/day38/fetuer/pages/course.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/course.dart';

class HomePageSemaster extends StatefulWidget {
  const HomePageSemaster({super.key});

  @override
  State<HomePageSemaster> createState() => _HomePageSemasterState();
}

class _HomePageSemasterState extends State<HomePageSemaster> {
  List<Semester> semesters = [];
  List<bool> expanded = [];
  SemasterControl semasterControl = SemasterControl();
  TextEditingController semasterSe = TextEditingController();
  TextEditingController sematery = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    semesters = semasterControl.getsumaster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GPA Calculater"),
      ),
      floatingActionButton: SizedBox(
        width: 180,
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            custom_show_dialog(context);
          },
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.marker),
              Text("add Semater"),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(miniSpacer),
          child: semesters.isEmpty
              ? notthinTodisplay(context)
              : Column(
                  children: [
                    topPart(context),
                    ExpansionPanelList(
                      expansionCallback: (panelIndex, isExpanded) {
                        expanded[panelIndex] =
                            expanded[panelIndex] ? false : true;
                      },
                      children: List.generate(
                          semesters.length,
                          (index) => ExpansionPanel(
                                isExpanded: expanded[index],
                                body: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Credits:0"),
                                        Text("Garde:0"),
                                        ElevatedButton(
                                            onPressed: () async {
                                              List<Coures> result =
                                                  await Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                return CouresPage(
                                                    coures: semesters[index]
                                                        .semasterCourses);
                                              }));
                                              semesters[index]
                                                  .semasterCourses
                                                  .addAll(result);
                                            },
                                            child: Text("Add Courses"))
                                      ]),
                                ),
                                headerBuilder: (context, isExpanded) {
                                  return Text(
                                      "semaster :${semesters[index].name}  ${semesters[index].year}");
                                },
                              )),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Container topPart(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.sizeOf(context).height / 4,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${semesters.first.name} ${semesters.first.year}",
              style: TextStyle(fontSize: 30),
            ),
            Icon(Icons.edit)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customRichText(
              title: "Your GPA ",
              subTitle: "3.85",
              colorSubtitle: Colors.green,
            ),
            customRichText(
              title: "Total Unites ",
              subTitle: "16",
              colorSubtitle: Colors.red,
            ),
          ],
        )
      ]),
    );
  }

  Future<dynamic> custom_show_dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormFiled(
                  label: "semater season",
                  controllerv: semasterSe,
                ),
                CustomTextFormFiled(
                  isnumber: true,
                  label: "semater year",
                  controllerv: sematery,
                ),
                ElevatedButton(
                    onPressed: () {
                      int id = semesters.isEmpty ? 1 : semesters.last.id + 1;
                      semasterControl.addSemasyer(
                          semester: Semester(
                              id: id,
                              name: semasterSe.text,
                              year: sematery.text));
                      expanded.add(false);

                      setState(() {});
                    },
                    child: Text("Save"))
              ],
            ),
          );
        });
  }

  Center notthinTodisplay(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2 - 100,
          ),
          FaIcon(
            FontAwesomeIcons.fileExcel,
            size: 50,
          ),
          Text(
            "Noting To Dispaly",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
