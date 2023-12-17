import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:flutter/material.dart';

class MianPage extends StatelessWidget {
  const MianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (context) => Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Customfiled(
                          lable: "note title",
                        ),
                        Customfiled(
                          lable: "note description",
                        ),
                        DropdownMenu(dropdownMenuEntries: []),
                        customButtomElev(
                          lable: "add new note",
                          backColor: black,
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ));
        },
        child: Icon(Icons.add_comment_outlined),
      ),
      appBar: AppBar(
        title: Text("note app"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(20),
                child: ListTile(
                  title: Text("note $index"),
                  subtitle: Text("note $index"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Chip(label: Text("tesat")),
                      ),
                      Icon(Icons.settings),
                    ],
                  ),
                ),
              )),
    );
  }
}
