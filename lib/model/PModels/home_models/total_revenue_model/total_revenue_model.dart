class TotalRevenueModel {
  bool? status;
  String? totalBooking;
  String? lastMonthBooking;
  String? totalRs;
  String? lastMonthRs;

  TotalRevenueModel(
      {this.status,
      this.totalBooking,
      this.lastMonthBooking,
      this.totalRs,
      this.lastMonthRs});

  TotalRevenueModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalBooking = json['total_booking'];
    lastMonthBooking = json['last_month_booking'];
    totalRs = json['total_rs'];
    lastMonthRs = json['last_month_rs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_booking'] = this.totalBooking;
    data['last_month_booking'] = this.lastMonthBooking;
    data['total_rs'] = this.totalRs;
    data['last_month_rs'] = this.lastMonthRs;
    return data;
  }
}
