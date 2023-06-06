class PostNotificationModel {
  String? id;
  String? notification;
  String? senderUserId;
  String? recieverUserId;
  String? createdAt;
  String? notificationType;
  Link? link;
  String? senderType;
  String? seen;
  String? userPhoto;
  String? name;

  PostNotificationModel(
      {this.id,
      this.notification,
      this.senderUserId,
      this.recieverUserId,
      this.createdAt,
      this.notificationType,
      this.link,
      this.senderType,
      this.seen,
      this.userPhoto,
      this.name});

  PostNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notification = json['notification'];
    senderUserId = json['sender_user_id'];
    recieverUserId = json['reciever_user_id'];
    createdAt = json['created_at'];
    notificationType = json['notification_type'];
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    senderType = json['sender_type'];
    seen = json['seen'];
    userPhoto = json['user_photo'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification'] = this.notification;
    data['sender_user_id'] = this.senderUserId;
    data['reciever_user_id'] = this.recieverUserId;
    data['created_at'] = this.createdAt;
    data['notification_type'] = this.notificationType;
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    data['sender_type'] = this.senderType;
    data['seen'] = this.seen;
    data['user_photo'] = this.userPhoto;
    data['name'] = this.name;
    return data;
  }
}

class Link {
  String? id;
  String? caption;
  String? userId;
  String? dateTime;
  String? postedBy;
  String? status;
  String? photo;
  List<String>? gallary;
  String? name;
  int? totalLikes;
  String? totalComments;
  int? likeByMe;
  int? savedByMe;
  int? postByMe;

  Link(
      {this.id,
      this.caption,
      this.userId,
      this.dateTime,
      this.postedBy,
      this.status,
      this.photo,
      this.gallary,
      this.name,
      this.totalLikes,
      this.totalComments,
      this.likeByMe,
      this.savedByMe,
      this.postByMe});

  Link.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    userId = json['user_id'];
    dateTime = json['date_time'];
    postedBy = json['posted_by'];
    status = json['status'];
    photo = json['photo'];
    gallary = json['gallary'].cast<String>();
    name = json['name'];
    totalLikes = json['total_likes'];
    totalComments = json['total_comments'];
    likeByMe = json['like_by_me'];
    savedByMe = json['saved_by_me'];
    postByMe = json['post_by_me'];
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
    data['total_likes'] = this.totalLikes;
    data['total_comments'] = this.totalComments;
    data['like_by_me'] = this.likeByMe;
    data['saved_by_me'] = this.savedByMe;
    data['post_by_me'] = this.postByMe;
    return data;
  }
}
