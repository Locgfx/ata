class UserPostModel {
  String? id;
  String? postId;
  String? caption;
  String? userId;
  String? dateTime;
  String? postedBy;
  String? status;
  String? photo;
  List<String>? gallary;
  String? name;
  int? totalLikes;
  int? isLiked;
  int? isSaved;
  int? postByMe;
  String? totalComments;

  UserPostModel(
      {this.id,
      this.caption,
      this.userId,
      this.postByMe,
      this.dateTime,
      this.postedBy,
      this.status,
      this.photo,
      this.gallary,
      this.totalLikes,
      this.isLiked,
      this.totalComments,
      this.isSaved,
      this.name});

  UserPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    postByMe = json['post_by_me'];
    caption = json['caption'];
    totalLikes = json['total_likes'];
    userId = json['user_id'];
    isSaved = json['saved_by_me'];
    totalComments = json['total_comments'];
    isLiked = json['like_by_me'];
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
    data['post_id'] = this.postId;
    data['caption'] = this.caption;
    data['post_by_me'] = this.postByMe;
    data['total_comments'] = this.totalComments;
    data['total_likes'] = this.totalLikes;
    data['saved_by_me'] = this.isSaved;
    data['like_by_me'] = this.isLiked;
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
