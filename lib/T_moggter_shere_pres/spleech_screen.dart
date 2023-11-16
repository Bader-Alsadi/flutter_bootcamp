// import 'package:app/T_moggter_shere_pres/home_page.dart';
// import 'package:app/T_moggter_shere_pres/login.dart';
// import 'package:app/talka%20app/core/theme/color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Splash_screen extends StatefulWidget {
//   const Splash_screen({super.key});

//   @override
//   State<Splash_screen> createState() => _Splash_screenState();
// }

// class _Splash_screenState extends State<Splash_screen> {
//   @override
//   Widget build(BuildContext context) {
//     authCheck(context);
//     return Scaffold(
//       backgroundColor: orange,
//       body: Center(child: SpinKitChasingDots(color: white)),
//     );
//   }

//   authCheck(BuildContext context) async {
//     await Future.delayed(Duration(seconds: 3));
//     SharedPreferences shared = await SharedPreferences.getInstance();

//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//       return shared.getInt("token") == null ? Login() : HomePage();
//     }));
//   }
// }
