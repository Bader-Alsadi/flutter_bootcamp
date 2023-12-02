import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
import 'package:floor/floor.dart';

@Entity(foreignKeys: [
  ForeignKey(childColumns: ["user_id"], parentColumns: ["id"], entity: User)
])
class Location{
@primaryKey
int? id;
String descripction;
int user_id;
String? create_at;

Location({this.id,required this.descripction,required this.user_id}){
  this.create_at=DateTime.now().toString();
}

}