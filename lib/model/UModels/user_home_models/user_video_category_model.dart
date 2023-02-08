class UserVideoCategoryModel {
  String? id;
  String? name;

  UserVideoCategoryModel({this.id, this.name});

  UserVideoCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}