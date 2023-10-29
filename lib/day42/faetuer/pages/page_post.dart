import 'package:app/day42/faetuer/contoller/post_contoller.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late PostContoller _postContoller;
  @override
  void initState() {
    _postContoller = PostContoller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _postContoller.getPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData)
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(miniSpacer),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child:
                                      Chip(label: Text("post ${index + 1}"))),
                              Text(
                                "title: ${snapshot.data![index].title}\n",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("body: ${snapshot.data![index].body}\n")
                            ],
                          ),
                        ));
              else
                return Center(
                  child: CircularProgressIndicator(),
                );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }
}
