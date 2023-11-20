import 'package:app/get_storge/home.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController namCon = TextEditingController();
  bool? theme, lang;
  GetStorage box = GetStorage();
  @override
  void initState() {
    super.initState();
    // namCon.text = box.read("name_txt") ?? "No value avaliable";
    theme = box.read("theme") ?? false;
    lang = box.read("lang") ?? false;
    box.listen(() {
      theme = box.read("theme") ?? false;
      lang = box.read("lang") ?? false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: theme! ? ThemeData.light() : ThemeData.dark(),
      home: Directionality(
          textDirection: lang! ? TextDirection.ltr : TextDirection.rtl,
          child: HomeS()),
    );
  }
}


// Scaffold(
//         appBar: AppBar(
//           title: const Text('Material App Bar'),
//         ),
//         body: Column(
//           children: [
//             TextFormField(
//               controller: namCon,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   box.write("name_txt", namCon.text);
//                 },
//                 child: Text("save"))
//           ],
//         ),
//       ),