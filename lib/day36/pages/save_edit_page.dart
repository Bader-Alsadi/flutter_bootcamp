import 'package:app/day36/models/coures.dart';
import 'package:app/day36/widgets/custom_filedForm.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class SaveEditPage extends StatefulWidget {
  SaveEditPage({super.key, required this.title, this.coures = null});
  late String title;
  Coures1? coures;

  @override
  State<SaveEditPage> createState() => _SaveEditPageState();
}

class _SaveEditPageState extends State<SaveEditPage> {
  TextEditingController couresName = TextEditingController();
  TextEditingController couresNoHoures = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.coures != null) {
      couresName.text = widget.coures!.name;
      couresNoHoures.text = widget.coures!.noHouers.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: miniSpacer + 10, vertical: smallSpacer),
        child: Column(children: [
          customTextfield(
            controller: couresName,
            label: "coruse name",
            format: "a-zA-Z ",
          ),
          SizedBox(
            height: miniSpacer,
          ),
          customTextfield(
            controller: couresNoHoures,
            label: "coruse noHoures",
            format: "0-9",
          ),
          Spacer(),
          SizedBox(
            height: 60,
            width: 300,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      Coures1(
                          name: couresName.text,
                          noHouers: int.parse(couresNoHoures.text)));
                },
                child: Text(widget.coures == null ? "save" : "edit")),
          ),
        ]),
      ),
    );
  }
}
