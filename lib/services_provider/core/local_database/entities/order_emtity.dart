// import 'package:app/services_provider/core/local_database/entities/service_entity.dart';
// import 'package:app/services_provider/core/local_database/entities/service_provider_entity.dart';
// import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
// import 'package:floor/floor.dart';

// @Entity(foreignKeys: [
//   ForeignKey(childColumns: ["User_id"], parentColumns: ["id"], entity: User),
//   ForeignKey(
//       childColumns: ["Service_id"], parentColumns: ["id"], entity: Service),
//   ForeignKey(
//       childColumns: ["Service_provider_id"],
//       parentColumns: ["id"],
//       entity: ServiceProvider)
// ])
// class Order {
//   @primaryKey
//   int? id;
//   int User_id;
//   int Service_id;
//   int Service_provider_id;
//   String? state;
//   String? create_at;
//   @ignore
//   String? serivec_name;
//   @ignore
//   String? user_name;

//   Order({
//     this.id,
//     required this.Service_provider_id,
//     required this.User_id,
//     required this.Service_id,
//   }) {
//     this.create_at = DateTime.now().toString();
//     this.state = "waiting";
//   }
// }
