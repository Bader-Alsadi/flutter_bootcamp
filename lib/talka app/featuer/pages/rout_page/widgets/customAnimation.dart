// BottomNavigationBarItem CustomAnimtionItmeBar(
//       {required String label,
//       required String lottiePath,
//       required AnimationController controller}) {
//     return NavigationDestination(
//         icon: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset(
//               lottiePath,
//               controller: controller,
//               height: 40,
//               width: 40,
//               onLoaded: (composition) {
//                 _controller
//                   ..duration = composition.duration
//                   ..forward();
//               },
//             ),
//             Text(label)
//           ],
//         ),
//         label: "");
//   }