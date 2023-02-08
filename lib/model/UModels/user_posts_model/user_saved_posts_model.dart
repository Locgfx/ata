class UserSavedPostsModel {
  String? id;
  String? postId;
  String? postType;
  String? userId;
  String? photo;
  List<String>? gallary;
  String? name;
  String? dateTime;
  String? caption;

  UserSavedPostsModel(
      {this.id,
        this.postId,
        this.postType,
        this.userId,
        this.photo,
        this.gallary,
        this.name,
        this.dateTime,
        this.caption});

  UserSavedPostsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    postType = json['post_type'];
    userId = json['user_id'];
    photo = json['photo'];
    gallary = json['gallary'].cast<String>();
    name = json['name'];
    dateTime = json['date_time'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['post_id'] = postId;
    data['post_type'] = postType;
    data['user_id'] = userId;
    data['photo'] = photo;
    data['gallary'] = gallary;
    data['name'] = name;
    data['date_time'] = dateTime;
    data['caption'] = caption;
    return data;
  }
}