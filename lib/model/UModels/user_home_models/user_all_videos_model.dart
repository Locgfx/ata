class UserAllVideosModel {
  String? id;
  String? name;
  String? video;
  String? videoPoster;
  String? category;

  UserAllVideosModel(
      {this.id, this.name, this.video, this.videoPoster, this.category});

  UserAllVideosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    video = json['video'];
    videoPoster = json['video_poster'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['video'] = video;
    data['video_poster'] = videoPoster;
    data['category'] = category;
    return data;
  }
}