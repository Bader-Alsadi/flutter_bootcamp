import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/image/index.jpeg"),

            ),
            title: Text("bader"),
            subtitle: Text("hii .."),
            trailing: CircleAvatar(radius: 15,
              backgroundColor: Colors.green,
              child: Center(child: Text("15"),),
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/image/index.jpeg"),

            ),
            title: Text("bader"),
            subtitle: Text("hii .."),
            trailing: CircleAvatar(radius: 15,
              backgroundColor: Colors.green,
              child: Center(child: Text("15"),),
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/image/index.jpeg"),

            ),
            title: Text("bader"),
            subtitle: Text("hii .."),
            trailing: CircleAvatar(radius: 15,
              backgroundColor: Colors.green,
              child: Center(child: Text("15"),),
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/image/index.jpeg"),

            ),
            title: Text("bader"),
            subtitle: Text("hii .."),
            trailing: CircleAvatar(radius: 15,
              backgroundColor: Colors.green,
              child: Center(child: Text("15"),),
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/image/index.jpeg"),

            ),
            title: Text("bader"),
            subtitle: Text("hii .."),
            trailing: CircleAvatar(radius: 15,
              backgroundColor: Colors.green,
              child: Center(child: Text("15"),),
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/image/index.jpeg"),

            ),
            title: Text("bader"),
            subtitle: Text("hii .."),
            trailing: CircleAvatar(radius: 15,
              backgroundColor: Colors.green,
              child: Center(child: Text("15"),),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
