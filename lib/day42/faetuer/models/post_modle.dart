class Post {
  late String id, title, body;

  Post.fromJosn(Map<String, dynamic> post) {
    this.id = post["id"].toString();
    this.title = post["title"];
    this.body = post["body"];
  }
}
