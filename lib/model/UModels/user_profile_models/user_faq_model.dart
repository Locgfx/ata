class UserFaqModel {
  String? ques;
  String? ans;

  UserFaqModel({this.ques, this.ans});

  UserFaqModel.fromJson(Map<String, dynamic> json) {
    ques = json['ques'];
    ans = json['ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['ques'] = ques;
    data['ans'] = ans;
    return data;
  }
}