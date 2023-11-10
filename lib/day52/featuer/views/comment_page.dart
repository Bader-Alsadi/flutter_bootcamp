import 'package:app/day52/featuer/contollers/comment_contrloer.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';

class Commentpage extends StatefulWidget {
  Commentpage({super.key, required this.id});
  String id;

  @override
  State<Commentpage> createState() => _CommentpageState();
}

class _CommentpageState extends State<Commentpage> {
  CommentContoller comentC = CommentContoller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("comment")),
      body: FutureBuilder(
          future: comentC.fetuchData(id: widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                            backgroundColor: snapshot.data![index].isActive!
                                ? orange
                                : black,
                            child: Text(
                              snapshot.data![index].blogId!,
                              style: TextStyle(color: white),
                            )),
                        title: Text(snapshot.data![index].createdAt!),
                        subtitle: Text(snapshot.data![index].content!),
                      ),
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: snapshot.data!.length);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
