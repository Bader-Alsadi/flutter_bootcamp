import 'dart:typed_data';

import 'package:app/services_provider/core/local_database/entities/area_entity.dart';
import 'package:floor/floor.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ["area_id"],
      parentColumns: ["id"],
      entity: Area,
      onDelete: ForeignKeyAction.setNull),

  
])
class User {
  @primaryKey
  int? id;
  String user_name;
  String cell_phone;
  String? email;
  Uint8List? user_image;
  int area_id;
  String? create_at;
  @ignore
  String? area_name;

  User(
      {this.id,
      required this.user_name,
      required this.cell_phone,
      this.email,
      this.user_image,
      required this.area_id}) {
    this.create_at = DateTime.now().toString();
  }
}
