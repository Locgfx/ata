class TotalEarningsModel {
  bool? status;
  String? allEarning;
  String? order;
  String? fixAmount;
  String? currentBalance;
  int? bankStatus;

  TotalEarningsModel(
      {this.status,
      this.allEarning,
      this.order,
      this.fixAmount,
      this.currentBalance,
      this.bankStatus});

  TotalEarningsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    allEarning = json['allEarning'];
    order = json['order'];
    fixAmount = json['fix_amount'];
    bankStatus = json['bank_status'];
    currentBalance = json['current_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['fix_amount'] = this.fixAmount;
    data['allEarning'] = this.allEarning;
    data['order'] = this.order;
    data['bank_status'] = this.bankStatus;
    data['current_balance'] = this.currentBalance;
    return data;
  }
}
