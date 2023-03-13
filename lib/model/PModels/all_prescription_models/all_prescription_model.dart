class AllPrescriptionModel {
  String? id;
  String? name;
  String? dateTime;
  String? transactionId;

  AllPrescriptionModel({this.id, this.name, this.dateTime, this.transactionId});

  AllPrescriptionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateTime = json['date_time'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_time'] = this.dateTime;
    data['transaction_id'] = this.transactionId;
    return data;
  }
}
