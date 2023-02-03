class UserTopPsychologistModel {
  String? id;
  String? name;
  String? icon;

  UserTopPsychologistModel({this.id, this.name, this.icon});

  UserTopPsychologistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}
