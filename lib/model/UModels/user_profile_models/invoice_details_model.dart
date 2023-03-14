class InvoiceDetailsModel {
  String? user;
  String? psychologist;
  String? issue;
  String? dateTime;
  String? totalPayment;
  String? amount;
  String? tax;
  String? discount;
  String? transactionId;
  String? name;
  String? designation;
  String? orderId;

  InvoiceDetailsModel(
      {this.user,
      this.psychologist,
      this.issue,
      this.dateTime,
      this.totalPayment,
      this.amount,
      this.tax,
      this.discount,
      this.transactionId,
      this.name,
      this.orderId,
      this.designation});

  InvoiceDetailsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    psychologist = json['psychologist'];
    issue = json['issue'];
    dateTime = json['date_time'];
    totalPayment = json['total_payment'];
    amount = json['amount'];
    tax = json['tax'];
    discount = json['discount'];
    transactionId = json['transaction_id'];
    name = json['name'];
    designation = json['designation'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['psychologist'] = this.psychologist;
    data['issue'] = this.issue;
    data['date_time'] = this.dateTime;
    data['total_payment'] = this.totalPayment;
    data['amount'] = this.amount;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    data['transaction_id'] = this.transactionId;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['order_id'] = this.orderId;
    return data;
  }
}
