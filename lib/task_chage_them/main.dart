import 'package:app/task_chage_them/setting.dart';
import 'package:app/task_chage_them/them_set.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init("them");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemaApp>(
      create: (context) => ThemaApp(),
      child: Matrer(),
    );
  }
}

class Matrer extends StatelessWidget {
  const Matrer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemaApp>(context).getthem(),
      home: Settings(),
    );
  }
}
