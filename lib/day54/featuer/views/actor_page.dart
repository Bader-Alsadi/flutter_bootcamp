import 'package:app/day54/core/helper/db_manger.dart';
import 'package:app/day54/core/helper/file_manager.dart';
import 'package:app/day54/featuer/models/actors_modle.dart';
import 'package:app/day54/featuer/viewmodels/actors_viewModle.dart';
import 'package:app/day54/featuer/viewmodels/awards_viewmodels.dart';
import 'package:app/day54/featuer/views/aword_page.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class ActorsPAge extends StatefulWidget {
  const ActorsPAge({super.key});

  @override
  State<ActorsPAge> createState() => _ActorsPAgeState();
}

class _ActorsPAgeState extends State<ActorsPAge> {
  AwardVeiwModel aworVM = AwardVeiwModel();
  TextEditingController namCon = TextEditingController();
  ActoreVeiwModel ActVM = ActoreVeiwModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    TextField(
                      controller: namCon,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          int code = await ActVM.saveDate(
                            Actore(
                              name: namCon.text,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("actor id: $code ")));
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Text("add")),
                  ],
                );
              });
        },
        child: Text("add"),
      ),
      appBar: AppBar(
        title: Text("actris"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    DBmanager().deleteDatabase();
                    setState(() {});
                  },
                  child: Text("Delete Database")),
              SizedBox(
                width: miniSpacer,
              ),
              ElevatedButton(
                  onPressed: () async {
                    List actores = await FileManager.geyObject
                        .getFile(path: "assets/actors.json");
                    List awards = await FileManager.geyObject
                        .getFile(path: "assets/awards.json");
                    ActVM.addall(row: actores, subrow: awards);

                    setState(() {});
                  },
                  child: Text("initdatabe")),
            ],
          ),
          FutureBuilder(
              future: ActVM.fetchDate(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * .8,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AwordPage(
                                      title: snapshot.data![index].name!,
                                      id: snapshot.data![index].id!);
                                }));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index].name!),
                              ),
                            )),
                  );
                } else
                  return Center(
                    child: Text("empty"),
                  );
              })
        ],
      ),
    );
  }
}
