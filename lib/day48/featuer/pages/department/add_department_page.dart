import 'package:app/day48/featuer/contoller/deparment_contoller.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class AddDeparmentPage extends StatefulWidget {
  const AddDeparmentPage({super.key});

  @override
  State<AddDeparmentPage> createState() => _AddDeparmentPageState();
}

class _AddDeparmentPageState extends State<AddDeparmentPage> {
  DeparmentContoller _deparmentContoller = DeparmentContoller();
  TextEditingController deparmentName = TextEditingController();
  bool deparmentState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: miniSpacer),
        height: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            TextField(
              controller: deparmentName,
            ),
            CheckboxListTile(
                title: Text("active department"),
                value: deparmentState,
                onChanged: (value) {
                  deparmentState = value!;
                  setState(() {});
                }),
            ElevatedButton(
                onPressed: () async {
                  int code = await _deparmentContoller.saveData(josn: {
                    "name": deparmentName.text,
                    "active": deparmentState
                  });
                  Navigator.pop(context, code);
                },
                child: Text("add"))
          ],
        ),
      ),
    );
  }
}
