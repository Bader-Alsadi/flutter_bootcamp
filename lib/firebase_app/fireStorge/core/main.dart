import 'package:app/firebase_app/fireStorge/featuer/modelviews/studendMV/studentVM.dart';
import 'package:app/firebase_app/fireStorge/featuer/views/display_student.dart';
import 'package:app/firebase_app/fireStorge/featuer/views/home_screen.dart';
import 'package:app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentVM(),
      child: MaterialApp(
        title: 'Material App',
        home: DispalyStudnet(),
      ),
    );
  }
}
