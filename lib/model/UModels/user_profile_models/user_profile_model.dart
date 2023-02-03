class UserProfileModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? dob;
  String? gender;
  String? relationshipStatus;
  String? occupation;
  String? photo;
  String? status;

  UserProfileModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.dob,
      this.gender,
      this.relationshipStatus,
      this.occupation,
      this.photo,
      this.status});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    gender = json['gender'];
    relationshipStatus = json['relationship_status'];
    occupation = json['occupation'];
    photo = json['photo'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['dob'] = dob;
    data['gender'] = gender;
    data['relationship_status'] = relationshipStatus;
    data['occupation'] = occupation;
    data['photo'] = photo;
    data['status'] = status;
    return data;
  }
}
