// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class Form_loing extends StatefulWidget {
//   const Form_loing({super.key});

//   @override
//   State<Form_loing> createState() => _Form_loingState();
// }

// class _Form_loingState extends State<Form_loing> {
//   GlobalKey<FormState> form_key = GlobalKey();
//   TextEditingController emaliText = TextEditingController();
//     TextEditingController passWord = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Colors.blue,
//       body: Container(
//         margin: EdgeInsets.only(top: 250),
//         padding: EdgeInsets.only(top: 100, left: 30, right: 30),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//             color: Colors.white),
//         child: Form(
//           key: form_key,
//           child: Column(children: [
//             textFiled(
//                 hit: "Enterr your Emali",
//                 lable: "Emali",
//                 icon: Icon(Icons.email)),
//             SizedBox(
//               height: 20,
//             ),
//             textFiled(
//                 hit: "Enterr your password",
//                 lable: "password",
//                 icon: Icon(Icons.password),
//                 passwordShow: true),
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               width: 150,
//               height: 40,
//               child: ElevatedButton(
//                 onPressed: (){
                  
//                   if(form_key.currentState!.validate())
//                   print("object");
//                 },
//                 child: Text("login"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     ));
//   }

//   Widget textFiled(
    
//       {required String hit,
//       required String lable,
//       required Icon icon,
//       bool? passwordShow = false}) {
//     return TextFormField(
//       if(passwordShow)
//       {
//          validator: (x)=>!x==null||x!.is("@")?"invald Emale format":null,

//       }else{
//         validator: (x)=>!x==null||x!.is("@")?"invald Emale format":null,
//       }
      
      
//       obscureText: passwordShow!,
//       decoration: InputDecoration(
//           hintText: hit,
//           label: Text("$lable"),
//           prefix: icon,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
//     );
//   }
// }
