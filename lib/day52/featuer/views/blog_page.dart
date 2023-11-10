import 'package:app/day52/featuer/contollers/blog_contoller.dart';
import 'package:app/day52/featuer/models/blod_modles.dart';
import 'package:app/day52/featuer/views/comment_page.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  TextEditingController BlogTitle = TextEditingController();
  TextEditingController BlogContent = TextEditingController();
  bool edit = false;
  BolgContoller bolgContoller = BolgContoller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("blog")),
      body: FutureBuilder(
          future: bolgContoller.fetuchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Commentpage(
                              id: snapshot.data![index].id!,
                            );
                          }));
                        },
                        child: ListTile(
                          title: Text(snapshot.data![index].title!),
                          subtitle: Text(snapshot.data![index].content!),
                          trailing: PopupMenuButton(itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: Text("add"),
                                onTap: () async {
                                  edit = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("adding"),
                                          content: StatefulBuilder(
                                              builder: (context, setState) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller: BlogTitle,
                                                ),
                                                TextField(
                                                  controller: BlogContent,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      int code =
                                                          await bolgContoller
                                                              .saveData(
                                                                  blog: Blog(
                                                        title: BlogTitle.text,
                                                        content:
                                                            BlogContent.text,
                                                      ));

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(code ==
                                                                      200
                                                                  ? "done"
                                                                  : "not done")));

                                                      setState(() {});
                                                      Navigator.pop(
                                                          context,
                                                          code == 200
                                                              ? true
                                                              : false);
                                                    },
                                                    child: Text("add"))
                                              ],
                                            );
                                          }),
                                        );
                                      });
                                  if (edit) setState(() {});
                                },
                              ),
                              PopupMenuItem(
                                child: Text("Edit"),
                                onTap: () async {
                                  edit = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        BlogTitle.text =
                                            snapshot.data![index].title!;
                                        return AlertDialog(
                                          title: Text("editing"),
                                          content: StatefulBuilder(
                                              builder: (context, setState) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller: BlogTitle,
                                                ),
                                                TextField(
                                                  controller: BlogContent,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      int code = await bolgContoller
                                                          .editData(
                                                              blog: Blog(
                                                                  id: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id,
                                                                  title:
                                                                      BlogTitle
                                                                          .text,
                                                                  content:
                                                                      BlogContent
                                                                          .text));

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(code ==
                                                                      200
                                                                  ? "done"
                                                                  : "not done")));

                                                      setState(() {});
                                                      Navigator.pop(
                                                          context,
                                                          code == 200
                                                              ? true
                                                              : false);
                                                    },
                                                    child: Text("edit"))
                                              ],
                                            );
                                          }),
                                        );
                                      });
                                  if (edit) setState(() {});
                                },
                              ),
                              PopupMenuItem(
                                child: Text("Delete"),
                                onTap: () async {
                                  int code = await bolgContoller.DeleteData(
                                      id: snapshot.data![index].id!);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(code == 200
                                              ? "done"
                                              : "not done")));
                                  setState(() {});
                                },
                              ),
                            ];
                          }),
                        ),
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
