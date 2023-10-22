import 'package:app/Data/edit_Page_data.dart';
import 'package:app/day38/fetuer/control/semaster_control.dart';
import 'package:app/day38/fetuer/models/semester.dart';
import 'package:app/theme/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageSemaster extends StatefulWidget {
  const HomePageSemaster({super.key});

  @override
  State<HomePageSemaster> createState() => _HomePageSemasterState();
}

class _HomePageSemasterState extends State<HomePageSemaster> {
  List<Semester> semesters = [];
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
        width: 150,
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
              : ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {},
                  children: List.generate(
                      semesters.length,
                      (index) => ExpansionPanel(
                            isExpanded: true,
                            body: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Credits:0"),
                                    Text("Garde:0"),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Add Courses"))
                                  ]),
                            ),
                            headerBuilder: (context, isExpanded) {
                              return Text(
                                  "${semesters[index].name} : ${semesters[index].year}");
                            },
                          )),
                ),
        ),
      ),
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
                  label: "semater year",
                  controllerv: sematery,
                ),
                SizedBox(
                  child: ElevatedButton(
                      onPressed: () {
                        semasterControl.addSemasyer(
                            semester: Semester(
                                name: semasterSe.text, year: sematery.text));
                        print(semasterSe.text);
                        setState(() {});
                      },
                      child: Text("Save")),
                )
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

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    required this.label,
    super.key,
    controllerv,
  });
  late String label;
  TextEditingController? controllerv;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerv,
      decoration: InputDecoration(label: Text(this.label)),
    );
  }
}
