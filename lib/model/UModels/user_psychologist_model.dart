class UPsychologistModel {
  String? psychologistId;
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

  UPsychologistModel(
      {this.psychologistId,
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['psychologist_id'] = psychologistId;
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
    if (specialities != null) {
      data['specialities'] = specialities!.map((v) => v.toJson()).toList();
    }
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
