import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  GetStorage box = GetStorage();
  bool? theme,lang;

  @override
  void initState() {
    theme= box.read("theme")??false;
    lang= box.read("lang")??false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("settings"),
      ),
      body: Column(
        children: [
          SwitchListTile(title: Text("theme"),value:theme! , onChanged: (newValue){
            box.write("theme", newValue);
            theme=newValue;
          }),
           SwitchListTile(title: Text("langague"),value:lang! , onChanged: (newValue){
            box.write("lang", newValue);
            lang=newValue;
          })
        ],
      ),
    );
  }
}