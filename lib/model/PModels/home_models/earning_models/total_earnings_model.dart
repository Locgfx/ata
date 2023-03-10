class TotalEarningsModel {
  bool? status;
  String? allEarning;
  String? order;
  String? fixAmount;

  TotalEarningsModel(
      {this.status, this.allEarning, this.order, this.fixAmount});

  TotalEarningsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    allEarning = json['allEarning'];
    order = json['order'];
    fixAmount = json['fix_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['fix_amount'] = this.fixAmount;
    data['allEarning'] = this.allEarning;
    data['order'] = this.order;
    return data;
  }
}
