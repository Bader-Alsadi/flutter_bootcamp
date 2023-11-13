import 'package:app/day53/featuer/models/manayTricker.dart';
import 'package:app/day53/featuer/modelviews/manayTricker.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SqlLitPage extends StatefulWidget {
  const SqlLitPage({super.key});

  @override
  State<SqlLitPage> createState() => _SqlLitPageState();
}

class _SqlLitPageState extends State<SqlLitPage> {
  ManayTrikerModleView manyMV = ManayTrikerModleView();
  TextEditingController amountCo = TextEditingController();
  bool state = false;
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              bottomshet(context);
            },
            child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text("sqllite CURD"),
        ),
        body: FutureBuilder(
            future: manyMV.fetchDate(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  SizedBox(
                    // height: 100,
                    // width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("income"),
                            Text(manyMV
                                .claIncomeAndExpended(snapshot.data!)["income"]
                                .toString())
                          ],
                        ),
                        Column(
                          children: [
                            Text("expended"),
                            Text(manyMV
                                .claIncomeAndExpended(snapshot.data!)["expende"]
                                .toString())
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => Card(
                        color: orange,
                        child: ListTile(
                          title: Text(snapshot.data![index].amount.toString()),
                          subtitle:
                              Text(snapshot.data![index].opretore ? "+" : "-"),
                          trailing: SizedBox(
                            width: 100,
                            child: ButtonBar(
                              children: [
                                InkWell(
                                    onTap: () {
                                      amountCo.text = snapshot
                                          .data![index].amount
                                          .toString();
                                      state = snapshot.data![index].opretore;
                                      edit = true;

                                      bottomshet(context,
                                          many: snapshot.data![index]);
                                    },
                                    child: Icon(Icons.edit)),
                                InkWell(
                                    onTap: () async {
                                      String message = "";
                                      int code = await manyMV.deleteData(
                                          snapshot.data![index].id!);

                                      message = code > 0 ? "done" : "not done";
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text(message)));
                                      setState(() {});
                                    },
                                    child: Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<dynamic> bottomshet(BuildContext context, {ManayTriker? many}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: amountCo,
              ),
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return DropdownButton(
                    value: state,
                    items: [
                      DropdownMenuItem(value: true, child: Text("income")),
                      DropdownMenuItem(value: false, child: Text("expended"))
                    ],
                    onChanged: ((value) {
                      state = value!;
                      setState(() {});
                    }),
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    String message = "";
                    int code;
                    if (edit) {
                      code = await manyMV.updateData(many!
                        ..amount = double.parse(amountCo.text)
                        ..opretore = state);
                      // print("result $code");
                      amountCo.clear();
                      edit = false;
                    } else {
                      code = await manyMV.saveDate(ManayTriker(
                          amount: double.parse(amountCo.text),
                          opretore: state));
                      edit = false;
                    }

                    if (code > 0)
                      message = "done";
                    else
                      message = "not done";

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text(edit ? "edit" : "add"))
            ],
          );
        });
  }
}
