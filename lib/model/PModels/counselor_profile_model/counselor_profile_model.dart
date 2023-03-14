import '../../../Apis/UserAPis/user_home_apis/user_specialist_model.dart';

class CounselorProfileModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? alternatePhone;
  String? address;
  String? timing;
  String? date;
  String? photo;
  String? about;
  String? gender;
  String? dob;
  String? designation;
  String? totalExprience;
  List<LanguageModel>? language;
  String? pricing;
  String? status;
  String? education;
  String? rating;
  String? signature;
  List<UserSpecialistModel>? specialities;

  CounselorProfileModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.alternatePhone,
      this.address,
      this.timing,
      this.date,
      this.photo,
      this.about,
      this.gender,
      this.dob,
      this.designation,
      this.totalExprience,
      this.language,
      this.pricing,
      this.status,
      this.education,
      this.rating,
      this.signature,
      this.specialities});

  CounselorProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    alternatePhone = json['alternate_phone'];
    address = json['address'];
    timing = json['timing'];
    date = json['date'];
    photo = json['photo'];
    about = json['about'];
    gender = json['gender'];
    dob = json['dob'];
    designation = json['designation'];
    totalExprience = json['total_exprience'];
    if (json['language'] != null) {
      language = <LanguageModel>[];
      json['language'].forEach((v) {
        language!.add(new LanguageModel.fromJson(v));
      });
    }
    pricing = json['pricing'];
    status = json['status'];
    education = json['education'];
    rating = json['rating'];
    signature = json['signature'];
    if (json['specialities'] != null) {
      specialities = <UserSpecialistModel>[];
      json['specialities'].forEach((v) {
        specialities!.add(new UserSpecialistModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['alternate_phone'] = this.alternatePhone;
    data['address'] = this.address;
    data['timing'] = this.timing;
    data['date'] = this.date;
    data['photo'] = this.photo;
    data['about'] = this.about;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['designation'] = this.designation;
    data['total_exprience'] = this.totalExprience;
    if (this.language != null) {
      data['language'] = this.language!.map((v) => v.toJson()).toList();
    }
    data['pricing'] = this.pricing;
    data['status'] = this.status;
    data['education'] = this.education;
    data['rating'] = this.rating;
    data['signature'] = this.signature;
    if (this.specialities != null) {
      data['specialities'] = this.specialities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
