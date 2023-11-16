import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class UserModleView {
  late List<Map<String, dynamic>> allUsers;

  UserModleView() {
    allUsers.add(
        {"emali": "ali@dmail.com", "name": "bader alsai", "password": "1234"});
    allUsers.add(
        {"emali": "bader@dmail.com", "name": "ali alsai", "password": "1234"});
    allUsers.add(
        {"emali": "aamr@dmail.com", "name": "amer alsai", "password": "1234"});
  }

  userLoin(String emali, String password) async {
    bool islogged = false;
    allUsers.forEach((element) async {
      if (element["emali"] == emali && element["password"]) {
        await useratu();
        islogged = true;
      }
    });
    return islogged;
  }

  useratu() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    share.setInt("token", Random().nextInt(20));
  }

  userlogou() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    share.remove("token");
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    //   return Splash_screen();
    // }));
  }
}
