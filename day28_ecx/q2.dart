import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTexeWd extends StatefulWidget {
  const AddTexeWd({super.key});

  @override
  State<AddTexeWd> createState() => _AddTexeWdState();
}

class _AddTexeWdState extends State<AddTexeWd> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Add Text widget Dynm",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Column(
                  children: List.generate(
                      index,
                      (index) => Column(
                            children: [
                              Text(
                                "Text${index + 1}",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          )),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      index++;
                      setState(() {});
                    },
                    child: Text("Add new widget "))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
