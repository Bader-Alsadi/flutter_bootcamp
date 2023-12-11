import 'dart:typed_data';

import 'package:app/services_provider/core/local_database/entities/category_entity.dart';
import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
import 'package:floor/floor.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ["Category_id"], parentColumns: ["id"], entity: Category),
      ForeignKey(
    childColumns: ["user_id"],
    parentColumns: ["id"],
    entity: User,
    onDelete: ForeignKeyAction.setNull,
    onUpdate: ForeignKeyAction.cascade,
  )
])
class ServiceProvider {
  @primaryKey
  int? id;
  int Category_id;
  String? detilas;
  String? create_at;
  int user_id;
  @ignore
  String? category_name;
  @ignore
  String? name;
  @ignore
  String? locatoin;
  @ignore
  String? cell_phone;
  @ignore
  Uint8List? user_image;

  ServiceProvider(
      {this.id,
      required this.user_id,
      required this.Category_id,
      this.detilas,
      this.category_name,
      this.name}) {
    this.create_at = DateTime.now().toString();
  }
}
