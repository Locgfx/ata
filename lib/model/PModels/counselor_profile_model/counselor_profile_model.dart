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
  String? language;
  String? pricing;
  String? status;
  String? education;
  String? rating;
  String? signature;
  String? specialities;

  CounselorProfileModel({
    this.id,
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
    this.specialities,
  });

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
    language = json['language'];
    pricing = json['pricing'];
    status = json['status'];
    education = json['education'];
    rating = json['rating'];
    signature = json['signature'];
    specialities = json['specialities'];
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
    data['language'] = this.language;
    data['pricing'] = this.pricing;
    data['status'] = this.status;
    data['education'] = this.education;
    data['rating'] = this.rating;
    data['signature'] = this.signature;
    data['specialities'] = this.specialities;
    return data;
  }
}
