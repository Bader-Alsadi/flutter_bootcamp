// import 'package:app/T_moggter_shere_pres/users_model_view.dart';
// import 'package:app/day43/home_page.dart';
// import 'package:flutter/material.dart';

// class Login extends StatelessWidget {
//   const Login({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailCon = TextEditingController();
//     TextEditingController passCon = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("login"),
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
              
//               controller: emailCon,
//             ),
//             TextField(
//               controller: passCon,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   bool islog = UMV.userLoin(emailCon.text, passCon.text);
//                   islog
//                       ? Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) {
//                           return HomePage();
//                         }))
//                       : ScaffoldMessenger.of(context)
//                           .showSnackBar(SnackBar(content: Text("not found")));
//                 },
//                 child: Text("login"))
//           ],
//         ),
//       ),
//     );
//   }
// }
