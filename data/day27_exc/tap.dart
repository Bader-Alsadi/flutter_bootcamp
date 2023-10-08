import 'package:app/data/day27_exc/taps/calls.dart';
import 'package:app/data/day27_exc/taps/chat.dart';
import 'package:app/data/day27_exc/taps/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapBar extends StatelessWidget {
  const TapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text("my tap"),
        bottom: TabBar(tabs: [
          Tab(child: Text("Chat"),icon: Icon(Icons.chat)),
          Tab(child: Text("Status"),icon: Icon(Icons.signal_wifi_statusbar_4_bar),),
          Tab(child: Text("Call"),icon: Icon(Icons.call_sharp),)
        ],),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Login"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("settings"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
            Divider(),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Chat(),
          Statu(),
          Call()
        ],
      ),
    ) ) ;
  }
}
