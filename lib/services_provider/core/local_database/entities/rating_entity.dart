import 'package:app/services_provider/core/local_database/entities/service_entity.dart';
import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
import 'package:floor/floor.dart';

@Entity(foreignKeys: [ForeignKey(childColumns: ["user_id"], parentColumns: ["id"], entity: User),
ForeignKey(childColumns: ["Service_id"], parentColumns: ["id"], entity: Service)
])
class Rating{
  @primaryKey
  int? id;
  int rate;
  int user_id;
  int Service_id;
  String? create_at;

  Rating({this.id,required this.rate,required this.Service_id,required this.user_id}){
    create_at=DateTime.now().toString();
  }
}