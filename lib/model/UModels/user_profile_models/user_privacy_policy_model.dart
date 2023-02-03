class UserPrivacyPolicyModel {
  String? id;
  String? title;
  String? text;

  UserPrivacyPolicyModel({this.id, this.title, this.text});

  UserPrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['text'] = text;
    return data;
  }
}
