import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifierColor extends ChangeNotifier {
  static NotifierColor? obg;

  NotifierColor._getObj();

  static NotifierColor getObject() {
    if (obg == null) obg = NotifierColor._getObj();
    return obg!;
  }

  setValu(Color color) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    await pre.setInt("color", color.value);
    notifyListeners();
  }

  Future<Color> getColor() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    var c = await pre.getInt("color");
    return  Color(c!);
  }
}
