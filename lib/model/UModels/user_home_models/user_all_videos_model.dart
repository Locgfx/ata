class UserAllVideoModel {
  String? id;
  String? name;
  List<Videos>? videos;

  UserAllVideoModel({this.id, this.name, this.videos});

  UserAllVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  String? id;
  String? name;
  String? video;
  String? videoPoster;
  String? category;

  Videos({this.id, this.name, this.video, this.videoPoster, this.category});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    video = json['video'];
    videoPoster = json['video_poster'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['video'] = this.video;
    data['video_poster'] = this.videoPoster;
    data['category'] = this.category;
    return data;
  }
}
