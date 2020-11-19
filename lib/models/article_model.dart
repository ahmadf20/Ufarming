import 'dart:convert';

List<Article> articleFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

class Article {
  Article({
    this.id,
    this.title,
    this.category,
    this.description,
    this.picture,
    this.source,
    this.createdAt,
    this.updatedAt,
    this.author,
  });

  int id;
  String title;
  String category;
  String description;
  String picture;
  String source;
  DateTime createdAt;
  DateTime updatedAt;
  String author;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        description: json["description"],
        picture: json["picture"],
        source: json["source"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        author: json["author"],
      );
}
