import 'dart:ffi';

import 'package:app/day36/cpntroler/coures_contoler.dart';
import 'package:app/day36/models/coures.dart';
import 'package:app/day36/pages/save_edit_page.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CouresMangement extends StatefulWidget {
  const CouresMangement({super.key});

  @override
  State<CouresMangement> createState() => _CouresMangementState();
}

class _CouresMangementState extends State<CouresMangement> {
  CouresContloer concou = CouresContloer();
  List<Coures1> coures = [];

  @override
  void initState() {
    coures = concou.allCoures;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Mangement"),
      ),
      body: coures.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                          onPressed: () async {
                            coures.add(await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SaveEditPage(title: "add course"))));
                            setState(() {});
                          },
                          child: Text("Add Coures"))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 140,
                    child: ListView.separated(
                        itemBuilder: (context, index) => SizedBox(
                              height: MediaQuery.of(context).size.height / 9,
                              child: ListTile(
                                title: Text(coures[index].name),
                                subtitle:
                                    Text(coures[index].noHouers.toString()),
                                trailing: Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        concou.editCouresInfo(
                                            index: index,
                                            coures: await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SaveEditPage(
                                                          title: "edit course",
                                                          coures: coures[index],
                                                        ))));
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        concou.removeCourse(
                                            nameCourse: coures[index].name);
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (_, __) => Divider(),
                        itemCount: coures.length),
                  )
                ],
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                          onPressed: () async {
                            coures.add(await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SaveEditPage(title: "add course"))));
                            setState(() {});
                          },
                          child: Text("Add Coures"))),
                  Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.watchmanMonitoring,
                        size: 100,
                      ),
                      SizedBox(
                        height: miniSpacer,
                      ),
                      Text(
                        "nothing to display".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                  Container()
                ],
              ),
            ),
    );
  }
}
