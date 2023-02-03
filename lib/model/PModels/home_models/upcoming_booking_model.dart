class UpcomingBookingModel {
  String? id;
  String? date;
  String? timeSlot;
  String? bookingDate;
  String? userId;
  String? name;
  String? photo;
  String? issueName;

  UpcomingBookingModel(
      {this.id,
      this.date,
      this.timeSlot,
      this.bookingDate,
      this.userId,
      this.name,
      this.photo,
      this.issueName});

  UpcomingBookingModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['date'] = date;
    data['time_slot'] = timeSlot;
    data['booking_date'] = bookingDate;
    data['user_id'] = userId;
    data['name'] = name;
    data['photo'] = photo;
    data['issue_name'] = issueName;
    return data;
  }
}
