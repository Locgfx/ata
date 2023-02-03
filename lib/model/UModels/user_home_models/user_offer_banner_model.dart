class UserOfferBannerModel {
  String? id;
  String? banner;
  String? name;

  UserOfferBannerModel({this.id, this.banner, this.name});

  UserOfferBannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banner = json['banner'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['banner'] = banner;
    data['name'] = name;
    return data;
  }
}
