class LastTransactionsModel {
  bool? status;
  List<AllTransaction>? allTransaction;

  LastTransactionsModel({this.status, this.allTransaction});

  LastTransactionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['allTransaction'] != null) {
      allTransaction = <AllTransaction>[];
      json['allTransaction'].forEach((v) {
        allTransaction!.add(new AllTransaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allTransaction != null) {
      data['allTransaction'] =
          this.allTransaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllTransaction {
  String? totalPayment;
  String? dateTime;
  String? transactionId;

  AllTransaction({this.totalPayment, this.dateTime, this.transactionId});

  AllTransaction.fromJson(Map<String, dynamic> json) {
    totalPayment = json['total_payment'];
    dateTime = json['date_time'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_payment'] = this.totalPayment;
    data['date_time'] = this.dateTime;
    data['transaction_id'] = this.transactionId;
    return data;
  }
}
