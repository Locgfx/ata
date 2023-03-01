class ProfileOrderHistoryModel {
  String? id;
  String? user;
  String? psychologist;
  String? issue;
  String? date;
  String? timeSlot;
  String? coupon;
  String? bookingDate;
  String? bookingType;
  String? status;
  String? payment;
  String? image;
  String? name;
  String? designation;

  ProfileOrderHistoryModel(
      {this.id,
      this.user,
      this.psychologist,
      this.issue,
      this.date,
      this.timeSlot,
      this.coupon,
      this.bookingDate,
      this.bookingType,
      this.status,
      this.payment,
      this.image,
      this.name,
      this.designation});

  ProfileOrderHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    psychologist = json['psychologist'];
    issue = json['issue'];
    date = json['date'];
    timeSlot = json['time_slot'];
    coupon = json['coupon'];
    bookingDate = json['booking_date'];
    bookingType = json['booking_type'];
    status = json['status'];
    payment = json['payment'];
    image = json['image'];
    name = json['name'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['psychologist'] = this.psychologist;
    data['issue'] = this.issue;
    data['date'] = this.date;
    data['time_slot'] = this.timeSlot;
    data['coupon'] = this.coupon;
    data['booking_date'] = this.bookingDate;
    data['booking_type'] = this.bookingType;
    data['status'] = this.status;
    data['payment'] = this.payment;
    data['image'] = this.image;
    data['name'] = this.name;
    data['designation'] = this.designation;
    return data;
  }
}
