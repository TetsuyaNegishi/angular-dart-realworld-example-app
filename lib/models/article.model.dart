import 'profile.model.dart';

class Article {
  String title;
  String slug;
  String body;
  String createdAt;
  String updatedAt;
  // List<String> tagList;
  String description;
  Profile author;
  // "favorited": false,
  // "favoritesCount": 0

  Article(this.title, this.slug, this.body, this.createdAt, this.updatedAt, this.description, this.author);

  factory Article.fromJson(Map<String, dynamic> article) {
    var author = Profile.fromJson(article['author']);

    return Article(article['title'], article['slug'], article['body'], article['createdAt'], article['updatedAt'], article['description'], author);
  }

  // Map toJson() => {'id': id, 'name': name};
}
