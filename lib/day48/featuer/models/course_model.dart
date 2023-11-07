class Course {
  String? name;
  String? cover;
  int? credits;
  bool? active;
  String? id;
  String? departmentId;

  Course(
      {this.name,
      this.cover,
      this.credits,
      this.active,
      this.id,
      this.departmentId});

  Course.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cover = json['cover'];
    credits = json['credits'];
    active = json['active'];
    id = json['id'];
    departmentId = json['departmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cover'] = this.cover;
    data['credits'] = this.credits;
    data['active'] = this.active;
    data['id'] = this.id;
    data['departmentId'] = this.departmentId;
    return data;
  }
}