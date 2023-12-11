import 'package:app/task_chage_them/them_set.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  Settings({super.key});
  List<Color> listc = [
    Colors.yellow,
    Colors.pink,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemaApp>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              // padding: EdgeInsets.all(10),
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: listc
                    .map((e) => InkWell(
                          onTap: () {
                            theme.setColor(e.value);
                          },
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: e,
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
          leading: InkWell(
              onTap: () {
                theme.toqqleThem();
              },
              child: theme.isDark
                  ? Icon(Icons.dark_mode)
                  : Icon(Icons.light_mode)),
        ),
      ),
    );
  }
}
