class CommentModel {
  String? id;
  String? comment;
  String? postType;
  String? dateTime;
  String? name;
  String? photo;
  String? totalReplies;
  String? commentedBy;
  int? totalLikes;
  int? isLiked;
  int? commentByMe;
  List<Replies>? replies;

  CommentModel(
      {this.id,
      this.comment,
      this.postType,
      this.dateTime,
      this.commentByMe,
      this.totalReplies,
      this.name,
      this.isLiked,
      this.totalLikes,
      this.commentedBy,
      this.photo,
      this.replies});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    commentedBy = json['commented_by'];
    totalReplies = json['total_replies'].toString();
    totalLikes = json['total_likes'];
    postType = json['post_type'];
    dateTime = json['date_time'];
    name = json['name'];
    isLiked = json['like_by_me'] ?? 0;
    commentByMe = json['comment_by_me'] ?? 0;
    photo = json['photo'];
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    } else {
      replies = <Replies>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['post_type'] = this.postType;
    data['like_by_me'] = this.isLiked;
    data['date_time'] = this.dateTime;
    data['name'] = this.name;
    data['photo'] = this.photo;
    if (this.replies != null) {
      data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Replies {
  String? id;
  String? reply;
  String? dateTime;
  String? name;
  String? photo;
  String? commentedBy;
  String? replyBy;
  int? replyByMe;
  Replies(
      {this.id,
      this.reply,
      this.dateTime,
      this.name,
      this.photo,
      this.replyByMe});

  Replies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    replyByMe = json['reply_by_me'] ?? 0;
    reply = json['reply'];
    commentedBy = json['comment_by'];
    replyBy = json['reply_by'];
    dateTime = json['date_time'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reply'] = this.reply;
    data['date_time'] = this.dateTime;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}
