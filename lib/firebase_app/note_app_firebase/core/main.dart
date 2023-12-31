import 'package:app/firebase_app/note_app_firebase/featuer/notes_VM/notes_VM.dart';
import 'package:app/firebase_app/note_app_firebase/featuer/views/main_page.dart';
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
    return ChangeNotifierProvider<NoteVM>(
        create: (context) => NoteVM(),
        child: MaterialApp(
            title: 'Material App',
            theme: ThemeData(useMaterial3: false),
            home: Scaffold(body: MainPage())));
  }
}
