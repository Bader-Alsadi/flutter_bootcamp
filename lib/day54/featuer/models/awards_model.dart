class wards {
  int? id;
  String? name;
  int? actoreId;

  wards({this.id, this.name, this.actoreId});

  wards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    actoreId = json['actore_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id ?? null;
    data['name'] = this.name;
    data['actor_id'] = this.actoreId;
    return data;
  }
}
