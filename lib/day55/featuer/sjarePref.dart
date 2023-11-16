import 'package:app/day43/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController gmaileCon = TextEditingController();
    TextEditingController passCon = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("share pre"),
      ),
      body: Column(
        children: [
          TextField(
            controller: gmaileCon,
          ),
          TextField(
            controller: passCon,
          ),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences pre = await SharedPreferences.getInstance();
                await pre.setString("name", gmaileCon.text);
                await pre.setString("gmail", passCon.text);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
              child: Text("login"))
        ],
      ),
    );
  }
}
