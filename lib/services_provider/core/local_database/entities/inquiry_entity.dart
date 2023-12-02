import 'package:app/services_provider/core/local_database/entities/service_provider_entity.dart';
import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
import 'package:floor/floor.dart';

@Entity(foreignKeys: [ForeignKey(childColumns: ["user_id"], parentColumns: ["id"], entity: User,onDelete: ForeignKeyAction.cascade),
ForeignKey(childColumns: ["Service_provider_id"], parentColumns: ["id"], entity: ServiceProvider,onDelete: ForeignKeyAction.cascade)
])
class Inquiry{
  @primaryKey
  int? id;
  String Inquiry_name;
  String? replay;
  bool is_read;
  int user_id;
  int Service_provider_id;
  String? create_at;
  @ignore
  String? ServiceProvider_name;
 


  Inquiry({this.id,this.replay,required this.Inquiry_name,required this.is_read,required this.Service_provider_id,required this.user_id}){
    create_at= DateTime.now().toString();
  }
  

}