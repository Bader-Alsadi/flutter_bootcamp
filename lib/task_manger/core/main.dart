import 'package:app/task_manger/core/helper/db_helper.dart';
import 'package:app/task_manger/core/viewModel/task_view_modle.dart';
import 'package:app/task_manger/views/dashborard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBhelper.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ChangeNotifierProvider(
      create: (context) => TaskVM(),
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: DashBoard(),
      ),
    ));
  }
}
