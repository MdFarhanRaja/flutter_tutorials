class PhotosItem {
  String? id;
  dynamic description;
  String? altDescription;
  Urls? urls;
  int? likes;
  bool? likedByUser;

  PhotosItem(
      {this.id,
      this.description,
      this.altDescription,
      this.urls,
      this.likes,
      this.likedByUser});

  PhotosItem.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    description = json["description"];
    altDescription = json["alt_description"];
    urls = json["urls"] == null ? null : Urls.fromJson(json["urls"]);
    likes = json["likes"];
    likedByUser = json["liked_by_user"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["description"] = description;
    _data["alt_description"] = altDescription;
    if (urls != null) {
      _data["urls"] = urls?.toJson();
    }
    _data["likes"] = likes;
    _data["liked_by_user"] = likedByUser;
    return _data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls(
      {this.raw,
      this.full,
      this.regular,
      this.small,
      this.thumb,
      this.smallS3});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json["raw"];
    full = json["full"];
    regular = json["regular"];
    small = json["small"];
    thumb = json["thumb"];
    smallS3 = json["small_s3"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["raw"] = raw;
    _data["full"] = full;
    _data["regular"] = regular;
    _data["small"] = small;
    _data["thumb"] = thumb;
    _data["small_s3"] = smallS3;
    return _data;
  }
}
