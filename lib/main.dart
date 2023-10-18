import 'package:app/main_page.dart';
import 'package:app/mangerRoutes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ApplictioThem themmode = ApplictioThem();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Man_page(),
      // theme: light,
      // darkTheme: dark,
      // themeMode: themmode.mode,
      debugShowCheckedModeBanner: false,
      // initialRoute: startPage,
      onGenerateRoute: RouteManger.generRoute,
    );
  }
}

// class pageThem extends StatefulWidget {
//   const pageThem({super.key});

//   @override
//   State<pageThem> createState() => _pageThemState();
// }

// class _pageThemState extends State<pageThem> {
//   bool isdark = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("chang them"),
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 300,
//             ),
//             Switch(
//                 value: isdark,
//                 onChanged: (val) {
//                   themmode.toggelThem(isdark);
//                   isdark = val;
//                   print(val);
//                   setState(() {});
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
