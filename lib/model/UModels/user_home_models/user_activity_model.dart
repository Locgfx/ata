class UserActivityModel {
  String? id;
  String? name;
  String? icon;
  String? image;

  UserActivityModel({this.id, this.name, this.icon, this.image});

  UserActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['image'] = image;
    return data;
  }
}
