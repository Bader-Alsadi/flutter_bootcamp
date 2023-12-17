// import 'package:app/day36/pages/couresPage.dart';
// import 'package:app/day38/fetuer/pages/home_page.dart';
// import 'package:app/excerses/clip_path.dart';
// import 'package:app/excerses/draggable.dart';
// import 'package:app/main_page.dart';
// import 'package:app/mangerRoutes.dart';
// import 'package:app/movie_app/featuers/pages/payment_mathod1.dart';
// import 'package:app/t_mogther/appliction.dart';
// import 'package:app/t_mogther/day37/slidable_lectuser.dart';
// import 'package:app/t_mogther/thems.dart';
// import 'package:app/movie_app/core/theme/colors.dart';

// import 'package:flutter/material.dart';


import 'package:app/T_moghter_database/featuers/views/online_product_view.dart';
import 'package:app/day48/featuer/pages/department/department_page.dart';
import 'package:app/day49/featuer/views/catogry_page.dart';
import 'package:app/day52/featuer/views/blog_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  
  runApp(const MyApp());
}

// ApplictioThem themmode = ApplictioThem();

// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});

// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     themmode.addListener(() {
// //       setState(() {});
// //     });
// //   }

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: pageThem(),
// //       theme: light,
// //       darkTheme: dark,
// //       themeMode: themmode.mode,
// //       debugShowCheckedModeBanner: false,
// //       // initialRoute: startPage,
// //       onGenerateRoute: RouteManger.generRoute,
// //     );
// //   }
// // }

// // stateless widget

class MyApp extends StatelessWidget {
 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: OnlineProdut(),
      ),
      // theme: light,
      // darkTheme: dark,
      // themeMode: themmode.mode,
      debugShowCheckedModeBanner: false,
      // initialRoute: startPage,
      // onGenerateRoute: RouteManger.generRoute,
    );
  }
}

// class _HomePageSemasterState {
// }

// class pageThem extends StatefulWidget {
//   const pageThem({super.key});

//   @override
//   State<pageThem> createState() => _pageThemState();
// }

// class _pageThemState extends State<pageThem> {
//   bool isdark = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("firest page"),
//         actions: [
//           Switch(
//               value: isdark,
//               onChanged: (val) {
//                 themmode.toggelThem(isdark);
//                 isdark = val;
//                 print(val);
//                 setState(() {});
//               })
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.desktop_access_disabled),
//       ),
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return SecondPage();
//               }));
//             },
//             child: Text(
//               "next page",
//               style: Theme.of(context)
//                   .textTheme
//                   .titleMedium!
//                   .copyWith(color: white),
//             )),
//       ),
//       // drawer: Drawer(
//       //   child: Column(
//       //     children: [
//       //       SizedBox(
//       //         height: 300,
//       //       ),
//       //       Switch(
//       //           value: isdark,
//       //           onChanged: (val) {
//       //             themmode.toggelThem(isdark);
//       //             isdark = val;
//       //             print(val);
//       //             setState(() {});
//       //           })
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }

// class SecondPage extends StatefulWidget {
//   const SecondPage({super.key});

//   @override
//   State<SecondPage> createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   bool isdark = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("second page"),
//         actions: [
//           Switch(
//               value: isdark,
//               onChanged: (val) {
//                 themmode.toggelThem(isdark);
//                 isdark = val;
//                 print(val);
//                 setState(() {});
//               })
//         ],
//       ),
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text("back")),
//       ),
//       // drawer: Drawer(
//       //   child: Column(
//       //     children: [
//       //       SizedBox(
//       //         height: 300,
//       //       ),

//       //     ],
//       //   ),
//     );
//   }
// }
