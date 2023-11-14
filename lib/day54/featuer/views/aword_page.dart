import 'package:app/day54/featuer/models/awards_model.dart';
import 'package:app/day54/featuer/viewmodels/awards_viewmodels.dart';
import 'package:flutter/material.dart';

class AwordPage extends StatefulWidget {
  AwordPage({super.key, required this.id,required this.title});
  String title;
  int id;
  @override
  State<AwordPage> createState() => _AwordPageState();
}

class _AwordPageState extends State<AwordPage> {
  AwardVeiwModel aworVM = AwardVeiwModel();
  TextEditingController namCon =TextEditingController();
  AwardVeiwModel awardVeiwModel = AwardVeiwModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          
        ),
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
                      int code =
                              await aworVM.saveDate(wards(name: namCon.text,actoreId: widget.id,));

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("actor id: ${widget.id} award id: $code")));
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
        body: FutureBuilder(
            future: awardVeiwModel.fetchDatt(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => ListTile(
                              title: Text(snapshot.data![index].name!),
                            ))
                    : Text("empty");
              } else
                return Center(
                  child: Text("empty"),
                );
            }));
  }
}
