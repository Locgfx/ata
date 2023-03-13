class PrescriptionDetailsModel {
  String? pName;
  String? weight;
  String? age;
  String? rp;

  PrescriptionDetailsModel({this.pName, this.weight, this.age, this.rp});

  PrescriptionDetailsModel.fromJson(Map<String, dynamic> json) {
    pName = json['p_name'];
    weight = json['weight'];
    age = json['age'];
    rp = json['rp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p_name'] = this.pName;
    data['weight'] = this.weight;
    data['age'] = this.age;
    data['rp'] = this.rp;
    return data;
  }
}
