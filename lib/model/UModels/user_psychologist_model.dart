class UPsychologistModel {
  String? psychologistId;
  String? language;
  String? about;
  String? designation;
  String? rating;
  String? name;
  String? email;
  String? phone;
  String? alternatePhone;
  String? totalExprience;
  String? education;
  String? address;
  String? profilePhoto;
  String? gender;
  String? dob;
  String? price;
  List<Specialities>? specialities;
  Availability? availability;

  UPsychologistModel(
      {this.psychologistId,
      this.language,
      this.about,
      this.availability,
      this.designation,
      this.rating,
      this.name,
      this.email,
      this.phone,
      this.alternatePhone,
      this.totalExprience,
      this.education,
      this.address,
      this.profilePhoto,
      this.gender,
      this.dob,
      this.price,
      this.specialities});

  UPsychologistModel.fromJson(Map<String, dynamic> json) {
    psychologistId = json['psychologist_id'];
    language = json['language'];
    about = json['about'];
    designation = json['designation'];
    rating = json['rating'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    alternatePhone = json['alternate_phone'];
    totalExprience = json['total_exprience'];
    education = json['education'];
    address = json['address'];
    profilePhoto = json['profile_photo'];
    gender = json['gender'];
    dob = json['dob'];
    price = json['price'];
    if (json['specialities'] != null) {
      specialities = <Specialities>[];
      json['specialities'].forEach((v) {
        specialities!.add(Specialities.fromJson(v));
      });
    }
    if (json['availability'] != null) {
      availability = Availability.fromJson(json['availability']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['psychologist_id'] = psychologistId;
    data['designation'] = designation;
    data['rating'] = rating;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['alternate_phone'] = alternatePhone;
    data['total_exprience'] = totalExprience;
    data['education'] = education;
    data['address'] = address;
    data['profile_photo'] = profilePhoto;
    data['gender'] = gender;
    data['dob'] = dob;
    data['price'] = price;
    data['language'] = language;
    data['about'] = about;
    if (specialities != null) {
      data['specialities'] = specialities!.map((v) => v.toJson()).toList();
    }
    data['availability'] = availability!.toJson();
    return data;
  }
}

class Specialities {
  String? specialitiesId;
  String? name;

  Specialities({this.specialitiesId, this.name});

  Specialities.fromJson(Map<String, dynamic> json) {
    specialitiesId = json['specialities_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['specialities_id'] = specialitiesId;
    data['name'] = name;
    return data;
  }
}

class Availability {
  Availability({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });
  late final String monday;
  late final String tuesday;
  late final String wednesday;
  late final String thursday;
  late final String friday;
  late final String saturday;
  late final String sunday;

  Availability.fromJson(Map<String, dynamic> json) {
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    sunday = json['sunday'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['monday'] = monday;
    _data['tuesday'] = tuesday;
    _data['wednesday'] = wednesday;
    _data['thursday'] = thursday;
    _data['friday'] = friday;
    _data['saturday'] = saturday;
    _data['sunday'] = sunday;
    return _data;
  }
}
