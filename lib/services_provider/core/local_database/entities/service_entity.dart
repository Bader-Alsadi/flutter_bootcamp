
import 'package:app/services_provider/core/local_database/entities/service_provider_entity.dart';
import 'package:floor/floor.dart';

@Entity(foreignKeys: [
ForeignKey(childColumns: ["Service_provider_id"], parentColumns: ["id"], entity: ServiceProvider,onDelete: ForeignKeyAction.cascade)
])
class Service{
  @primaryKey
  int? id;
  String Service_name;
  String description;
  int Service_provider_id;
  String? create_at;

  @ignore
  String? servicesProviderName;

  Service({this.id,required this.Service_name,required this.description,required this.Service_provider_id}){
    create_at = DateTime.now().toString();
  }

}