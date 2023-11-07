class Department{
  late String id,name;
  late bool active;
  Department({required this.id,required this.name,this.active=false});
  Department.fromJosn( Map<String,dynamic> josn){
    id = josn["id"];
    name = josn["name"];
    active = josn["active"];
  }

  toJosn (){
    return {
      
      "name":this.name,
      "active":this.active,
    };
  }
}