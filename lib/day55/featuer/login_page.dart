import 'package:app/T_moggter_shere_pres/users_model_view.dart';
import 'package:app/day43/home_page.dart';
import 'package:app/day55/featuer/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginP extends StatelessWidget {
  const LoginP({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCon = TextEditingController();
    TextEditingController passCon = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailCon,
            ),
            TextField(
              controller: passCon,
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences pre = await SharedPreferences.getInstance();
                  await pre.setString("name", emailCon.text);
                  await pre.setString("gmail", passCon.text);
                  print(await pre.getString("name"));
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomePageP();
                  }));
                },
                child: Text("login"))
          ],
        ),
      ),
    );
  }
  
}
