class TermsModel {
  String? id;
  String? title;
  String? text;

  TermsModel({this.id, this.title, this.text});

  TermsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['text'] = this.text;
    return data;
  }
}
