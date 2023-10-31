import 'package:app/day43/featuer/contller/post_contoller.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostContoller postContoller = PostContoller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        appBar: AppBar(),
        body: FutureBuilder(
            future: postContoller.fetuchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.all(miniSpacer),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: miniSpacer,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(color: white),
                          padding: EdgeInsets.all(miniSpacer),
                          child: Column(children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      snapshot.data![index].owner!.picture!),
                                ),
                                SizedBox(
                                  width: miniSpacer,
                                ),
                                Text(
                                    "${snapshot.data![index].owner!.title} ${snapshot.data![index].owner!.firstName!} ${snapshot.data![index].owner!.lastName!}  \n ${snapshot.data![index].publishDate}"),
                              ],
                            ),
                            SizedBox(
                              height: miniSpacer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    snapshot.data![index].image!,
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.5,
                                    height:
                                        MediaQuery.sizeOf(context).height / 4,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data![index].publishDate!),
                                    SizedBox(
                                      height: miniSpacer,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.5,
                                        child:
                                            Text(snapshot.data![index].text!)),
                                    SizedBox(
                                      height: miniSpacer,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width /
                                          2.3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: List.generate(
                                            snapshot.data![index].tags!.length,
                                            (ind) => Flexible(
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          color: orange,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Text(
                                                        snapshot.data![index]
                                                            .tags![ind],
                                                        maxLines: 1,
                                                      )),
                                                )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: miniSpacer,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.favorite,
                                        color: orange,
                                      )),
                                      TextSpan(
                                          text:
                                              " ${snapshot.data![index].likes!}",
                                          style: TextStyle(color: black))
                                    ]))
                                  ],
                                )
                              ],
                            )
                          ])),
                    ),
                  );
                } else
                  return Center(
                    child: Text("no data"),
                  );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }));
  }
}
