import 'profile.model.dart';

class Article {
  String title;
  String slug;
  String body;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> tagList;
  String description;
  Profile author;
  // "favorited": false,
  // "favoritesCount": 0

  Article(this.title, this.slug, this.body, this.createdAt, this.updatedAt, this.tagList, this.description, this.author);

  factory Article.fromJson(Map<String, dynamic> article) {
    var createdAt = DateTime.parse(article['createdAt']);
    var updatedAt = DateTime.parse(article['updatedAt']);
    var tagList = article['tagList'].cast<String>();
    var author = Profile.fromJson(article['author']);

    return Article(article['title'], article['slug'], article['body'], createdAt, updatedAt, tagList, article['description'], author);
  }

  // Map toJson() => {'id': id, 'name': name};
}
