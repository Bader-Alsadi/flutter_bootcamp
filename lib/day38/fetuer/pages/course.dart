import 'package:app/day38/core/gpa_data.dart';
import 'package:app/day38/core/widgits/customTextFiled.dart';
import 'package:app/day38/core/widgits/custom_rich_text.dart';
import 'package:app/day38/fetuer/control/course_controler.dart';
import 'package:app/day38/fetuer/models/course.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CouresPage extends StatefulWidget {
  CouresPage({required this.coures, super.key});
  late List<Coures> coures;

  @override
  State<CouresPage> createState() => _CouresPageState();
}

class _CouresPageState extends State<CouresPage> {
  TextEditingController corursname = TextEditingController();
  TextEditingController corurcridts = TextEditingController();
  CourseControler couresContloer = CourseControler();
  List<Coures> allCoures = [];
  Map<String, dynamic> dropDownValue = AppList.gpaConversion[0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCoures = couresContloer.getCoures();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pop(context,allCoures);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("GPA Calculater"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customRichText(
                      title: "GPA",
                      subTitle: "3.57",
                      colorSubtitle: Colors.red,
                    ),
                    customRichText(
                      title: "Cridts",
                      subTitle: allCoures.isEmpty
                          ? "0"
                          : couresContloer.getCredits().toString(),
                      colorSubtitle: Colors.red,
                    )
                  ],
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: ElevatedButton(
                        onPressed: () {
                          custom_show_dialog(context);
                          setState(() {});
                        },
                        child: Text("+ New Course"))),
                Column(
                  children: List.generate(
                      allCoures.length,
                      (index) => Container(
                            margin: index != 0
                                ? EdgeInsets.only(bottom: 20)
                                : EdgeInsets.only(top: 20, bottom: 20),
                            padding: EdgeInsets.all(20),
                            height: MediaQuery.sizeOf(context).height / 5,
                            width: MediaQuery.sizeOf(context).width - 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: yellow.withOpacity(0.7),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  allCoures[index].name,
                                  style: TextStyle(fontSize: 30),
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customRichText(
                                      title: "Credits",
                                      subTitle:
                                          allCoures[index].credits.toString(),
                                      colorSubtitle: Colors.red,
                                    ),
                                    customRichText(
                                      title: "Grade (letter)",
                                      subTitle: allCoures[index].gpa["letter"],
                                      colorSubtitle: Colors.red,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  custom_show_dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormFiled(
                    label: "coures name",
                    controllerv: corursname,
                  ),
                  CustomTextFormFiled(
                    isnumber: true,
                    label: "coures cridtes",
                    controllerv: corurcridts,
                  ),
                  DropdownButton(
                      value: dropDownValue,
                      items: List.generate(
                          AppList.gpaConversion.length,
                          (index) => DropdownMenuItem(
                              value: AppList.gpaConversion[index],
                              child: Text(
                                  "${AppList.gpaConversion[index]["letter"]}:${AppList.gpaConversion[index]["gpa_scale"]}"))),
                      onChanged: (value) {
                        dropDownValue = value!;
                        setState(
                          () {},
                        );
                      }),
                  ElevatedButton(
                      onPressed: () {
                      
                        setState(
                          () {},
                        );
                        couresContloer.addCoures(
                            coures: Coures(
                                name: corursname.text,
                                credits: int.parse(corurcridts.text),
                                gpa: dropDownValue));
                        Navigator.pop(context);
                      },
                      child: Text("Save"))
                ],
              ),
            ),
          );
        });
  }

  refrech(SetState) {
    setState(() {});
  }
}
