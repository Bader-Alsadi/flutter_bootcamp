import 'package:app/day48/featuer/contoller/corese_contoller.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CouresPage extends StatefulWidget {
  CouresPage({super.key, required this.id});

  late String id;

  @override
  State<CouresPage> createState() => _CouresPageState();
}

class _CouresPageState extends State<CouresPage> {
  CourseContller courseContller = CourseContller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("coures"),
      ),
      body: FutureBuilder(
          future: courseContller.fetuchData(id: widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].name!),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: black,
                        child: Text(
                          snapshot.data![index].id!,
                          style: TextStyle(color: white),
                        ),
                      ),
                      trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                                PopupMenuItem(child: Text("edit")),
                                PopupMenuItem(child: Text("delete")),
                              ]),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
