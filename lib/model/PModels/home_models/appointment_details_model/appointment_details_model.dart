class AppointmentDetailsModel {
  String? name;
  String? photo;
  String? gender;
  String? dob;
  String? relationshipStatus;
  String? occupation;
  String? date;
  String? timeSlot;
  String? issue;

  AppointmentDetailsModel(
      {this.name,
      this.photo,
      this.gender,
      this.dob,
      this.relationshipStatus,
      this.occupation,
      this.date,
      this.timeSlot,
      this.issue});

  AppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    gender = json['gender'];
    dob = json['dob'];
    relationshipStatus = json['relationship_status'];
    occupation = json['occupation'];
    date = json['date'];
    timeSlot = json['time_slot'];
    issue = json['issue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['relationship_status'] = this.relationshipStatus;
    data['occupation'] = this.occupation;
    data['date'] = this.date;
    data['time_slot'] = this.timeSlot;
    data['issue'] = this.issue;
    return data;
  }
}
