class SearchVideoModel {
  String? id;
  String? name;
  String? video;
  String? videoPoster;
  String? category;

  SearchVideoModel(
      {this.id, this.name, this.video, this.videoPoster, this.category});

  SearchVideoModel.fromJson(Map<String, dynamic> json) {
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
