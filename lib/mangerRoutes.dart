// import 'package:app/data/day27_exc/taps/status.dart';
// import 'package:app/view/ProductShow.dart';
// import 'package:app/view/cart_page.dart';
// import 'package:app/view/multprod.dart';
// import 'package:app/view/not_found.dart';
// import 'package:app/view/productDetiles.dart';
// import 'package:flutter/material.dart';

// import 'modle/produc.dart';

// class RouteManger {
//   static Route<dynamic>? generRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case "/home":
//         {
//           return MaterialPageRoute(builder: (cmc) {
//             return ProdcutView();
//           });
//         }
//       case '/details':
//         {
//           ProductModel product = settings.arguments as ProductModel;
//           return MaterialPageRoute(builder: (ctx) {
//             return ProductDetails(
//               product: product,
//             );
//           });
//         }
//       case '/cart':
//         {
//           // ProductModel product=settings.arguments as ProductModel;
//           return MaterialPageRoute(builder: (ctx) {
//             return CadtView();
//           });
//         }
//       // case '/detalsMu':{
//       //   List<ProductModel> product=settings.arguments as List<ProductModel>;
//       //   return MaterialPageRoute(builder: (ctx){
//       //     return Multipro( product);

//       //   });
//       // }
//       default:
//         return MaterialPageRoute(builder: (cmc) {
//           return NotFound();
//         });
//     }
//   }
// }
