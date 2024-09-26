class PostData {
  int? id;
  String? title;
  String? body;

  PostData({this.id, this.title, this.body});

  PostData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["body"] = body;
    return _data;
  }
}
