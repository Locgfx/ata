class UpcomingOrderData {
  UpcomingOrderData({required this.data});
  late final List<UpcomingOrders> data;

  UpcomingOrderData.fromList(List json) {
    data = json.map((e) => UpcomingOrders.fromJson(e)).toList();
  }
}

class UpcomingOrders {
  UpcomingOrders({
    required this.id,
    required this.user,
    required this.psychologist,
    required this.issue,
    required this.issueName,
    required this.date,
    required this.timeSlot,
    required this.coupon,
    required this.bookingDate,
    required this.bookingType,
    required this.status,
    required this.payment,
    required this.name,
    required this.designation,
  });
  late final String id;
  late final String user;
  late final String image;
  late final String psychologist;
  late final String issue;
  late final String issueName;
  late final String date;
  late final String timeSlot;
  late final String? coupon;
  late final String bookingDate;
  late final String bookingType;
  late final String status;
  late final String payment;
  late final String name;
  late final String designation;

  UpcomingOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    psychologist = json['psychologist'];
    issue = json['issue'];
    issueName = json['issue_name'];
    date = json['date'];
    image = json['image'];
    timeSlot = json['time_slot'];
    coupon = json['coupon'] ?? "";
    bookingDate = json['booking_date'];
    bookingType = json['booking_type'];
    status = json['status'];
    payment = json['payment'];
    name = json['name'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user'] = user;
    _data['psychologist'] = psychologist;
    _data['issue'] = issue;
    _data['issue_name'] = issueName;
    _data['date'] = date;
    _data['image'] = image;
    _data['time_slot'] = timeSlot;
    _data['coupon'] = coupon;
    _data['booking_date'] = bookingDate;
    _data['booking_type'] = bookingType;
    _data['status'] = status;
    _data['payment'] = payment;
    return _data;
  }
}
