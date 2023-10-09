// // import 'package:app/day29_exc/data.dart';
// // import 'dart:js_util';

// import 'package:faker/faker.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Serashpage extends StatefulWidget {
//   const Serashpage({super.key});

//   @override
//   State<Serashpage> createState() => _SerashpageState();
// }

// class _SerashpageState extends State<Serashpage> {
//   List<Person> allPerson = [];
//   List<Person> serList = [];
//   TextEditingController tesSer = TextEditingController();
//   GlobalKey<FormState> key_se = GlobalKey();

//   @override
//   void initState() {
//     ListDa ld = ListDa();
//     allPerson = ld.gitList();
//     serList = allPerson;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var padding = size.width / 12;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//               width: size.width,
//               padding: EdgeInsets.only(left: padding, right: padding, top: 60),
//               child: Column(
//                 children: [
//                   Form(
//                       key: key_se,
//                       child: SearchBar(
//                         controller: tesSer,
//                         hintText: "Serash by emali",
//                         // hintStyle: MaterialStateProperty<TextStyle>!(),

//                         // onSubmitted: (tesSer){
//                         //    if (tesSer.isEmpty) serList = allPerson;
//                         //   serList = allPerson
//                         //       .where((element) => element.emali
//                         //           .toLowerCase()
//                         //           .contains(tesSer.toLowerCase()))
//                         //       .toList();
//                         // },
//                         onChanged: (tesSer) {
//                           if (tesSer.isEmpty) serList = allPerson;
//                           serList = allPerson
//                               .where((element) => element.emali
//                                   .toLowerCase()
//                                   .contains(tesSer.toLowerCase()))
//                               .toList();
//                           setState(() {});
//                         },
//                       )),
//                   Container(
//                     child: Column(
//                       children: List.generate(
//                           serList.length,
//                           (index) => ListTile(
//                                 title: Text(
//                                   "${serList[index].name}",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 subtitle: Text("${serList[index].emali}"),
//                               )),
//                     ),
//                   )
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }

// class Person {
//   late String name, emali, id;
//   Person({required this.name, required this.emali, required this.id});
// }

// // class ListDa {
// //   static Faker faker = Faker();

// //   gitList() {
// //     List<Person> li = List.generate(20, (index) {
// //       return Person(
// //           emali: faker.internet.email(),
// //           name: faker.person.name(),
// //           id: faker.guid.guid());
// //     });

// //     return li;
// //   }
// // }
