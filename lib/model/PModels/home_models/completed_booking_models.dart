class CompletedBookingModel {
  String? id;
  String? date;
  String? timeSlot;
  String? bookingDate;
  String? userId;
  String? name;
  String? photo;
  String? issueName;

  CompletedBookingModel(
      {this.id,
      this.date,
      this.timeSlot,
      this.bookingDate,
      this.userId,
      this.name,
      this.photo,
      this.issueName});

  CompletedBookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    timeSlot = json['time_slot'];
    bookingDate = json['booking_date'];
    userId = json['user_id'];
    name = json['name'];
    photo = json['photo'];
    issueName = json['issue_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time_slot'] = this.timeSlot;
    data['booking_date'] = this.bookingDate;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['issue_name'] = this.issueName;
    return data;
  }
}
