class UserAgreementModel {
  String? id;
  String? title;
  String? text;

  UserAgreementModel({this.id, this.title, this.text});

  UserAgreementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['text'] = text;
    return data;
  }
}


