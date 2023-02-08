class UserPostModel {
  String? id;
  String? caption;
  String? userId;
  String? dateTime;
  String? postedBy;
  String? status;
  String? photo;
  List<String>? gallary;
  String? name;

  UserPostModel(
      {this.id,
        this.caption,
        this.userId,
        this.dateTime,
        this.postedBy,
        this.status,
        this.photo,
        this.gallary,
        this.name});

  UserPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    userId = json['user_id'];
    dateTime = json['date_time'];
    postedBy = json['posted_by'];
    status = json['status'];
    photo = json['photo'];
    gallary = json['gallary'].cast<String>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['user_id'] = this.userId;
    data['date_time'] = this.dateTime;
    data['posted_by'] = this.postedBy;
    data['status'] = this.status;
    data['photo'] = this.photo;
    data['gallary'] = this.gallary;
    data['name'] = this.name;
    return data;
  }
}