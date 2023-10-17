import 'package:app/appliction.dart';
import 'package:app/main_page.dart';
import 'package:app/mangerRoutes.dart';
import 'package:app/routeNames.dart';
import 'package:app/thems.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

ApplictioThem themmode = ApplictioThem();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    themmode.addListener(() {
      print(themmode.mode);
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pageThem(),
      theme: light,
      darkTheme: dark,
      themeMode: themmode.mode,
      debugShowCheckedModeBanner: false,
      // initialRoute: startPage,
      onGenerateRoute: RouteManger.generRoute,
    );
  }
}

class pageThem extends StatefulWidget {
  const pageThem({super.key});

  @override
  State<pageThem> createState() => _pageThemState();
}

class _pageThemState extends State<pageThem> {
  bool isdark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chang them"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Switch(
                value: isdark,
                onChanged: (val) {
                  themmode.toggelThem(isdark);
                  isdark = val;
                  print(val);
                  setState(() {});
                })
          ],
        ),
      ),
    );
  }
}
