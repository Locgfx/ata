class SlotsModel {
  bool? status;
  AvailabilityData? availabilityData;

  SlotsModel({this.status, this.availabilityData});

  SlotsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    availabilityData = json['availability_data'] != null
        ? new AvailabilityData.fromJson(json['availability_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.availabilityData != null) {
      data['availability_data'] = this.availabilityData!.toJson();
    }
    return data;
  }
}

class AvailabilityData {
  String? id;
  String? psychologistId;
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;
  String? sunday;
  String? slotTime;
  String? lunchTimeStart;
  String? lunchTimeEnd;
  String? sunStatus;
  String? monStatus;
  String? tuesStatus;
  String? wedStatus;
  String? thurStatus;
  String? friStatus;
  String? satStatus;

  AvailabilityData(
      {this.id,
      this.psychologistId,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday,
      this.slotTime,
      this.lunchTimeStart,
      this.lunchTimeEnd,
      this.sunStatus,
      this.monStatus,
      this.tuesStatus,
      this.wedStatus,
      this.thurStatus,
      this.friStatus,
      this.satStatus});

  AvailabilityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    psychologistId = json['psychologist_id'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    sunday = json['sunday'];
    slotTime = json['slot_time'];
    lunchTimeStart = json['lunch_time_start'];
    lunchTimeEnd = json['lunch_time_end'];
    sunStatus = json['sun_status'];
    monStatus = json['mon_status'];
    tuesStatus = json['tues_status'];
    wedStatus = json['wed_status'];
    thurStatus = json['thur_status'];
    friStatus = json['fri_status'];
    satStatus = json['sat_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['psychologist_id'] = this.psychologistId;
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['sunday'] = this.sunday;
    data['slot_time'] = this.slotTime;
    data['lunch_time_start'] = this.lunchTimeStart;
    data['lunch_time_end'] = this.lunchTimeEnd;
    data['sun_status'] = this.sunStatus;
    data['mon_status'] = this.monStatus;
    data['tues_status'] = this.tuesStatus;
    data['wed_status'] = this.wedStatus;
    data['thur_status'] = this.thurStatus;
    data['fri_status'] = this.friStatus;
    data['sat_status'] = this.satStatus;
    return data;
  }
}
