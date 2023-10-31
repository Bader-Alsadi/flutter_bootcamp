

class Post {
  String? title, body;
  Post({required this.title, required this.body});

  Post.formJosn(Map<String, dynamic> json) {
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    return {"title": title, "body": body};
  }
}
