class UserSpecialistModel {
  String? id;
  String? name;
  String? icon;

  UserSpecialistModel({this.id, this.name, this.icon});

  UserSpecialistModel.fromJson(Map<String, dynamic> json) {
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

class LanguageModel {
  String? id;
  String? name;

  LanguageModel({this.id, this.name});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
