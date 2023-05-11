class NotificationModel {
  String? id;
  String? notification;
  String? senderUserId;
  String? recieverUserId;
  String? createdAt;
  String? notificationType;
  String? link;
  String? senderType;
  String? seen;
  String? userPhoto;
  String? name;

  NotificationModel(
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

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notification = json['notification'];
    senderUserId = json['sender_user_id'];
    recieverUserId = json['reciever_user_id'];
    createdAt = json['created_at'];
    notificationType = json['notification_type'];
    link = json['link'];
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
    data['link'] = this.link;
    data['sender_type'] = this.senderType;
    data['seen'] = this.seen;
    data['user_photo'] = this.userPhoto;
    data['name'] = this.name;
    return data;
  }
}
