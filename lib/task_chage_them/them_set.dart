import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemaApp extends ChangeNotifier {
  Color colorApp = Colors.white;
  GetStorage box = GetStorage("them");
  bool isDark = false;

  ThemaApp() {
    isDark = box.read("them") ?? false;
  }

  ThemeData getthem() {
    return isDark
        ? ThemeData.dark()
            .copyWith(colorScheme: ColorScheme.fromSeed(seedColor: colorApp))
        : ThemeData.light()
            .copyWith(colorScheme: ColorScheme.fromSeed(seedColor: colorApp));
  }

  toqqleThem() {
    isDark = !isDark;
    box.write("them", isDark);
    notifyListeners();
  }

  setColor(int colorValue) {
    colorApp = Color(colorValue);
    notifyListeners();
  }
}
