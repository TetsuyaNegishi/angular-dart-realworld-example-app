class Article {
  String title;
  String slug;
  String body;
  String createdAt;
  String updatedAt;
  // List<String> tagList;
  String description;
  // "author": {
  //   String username;
  //   "bio": null,
  //   String image;
  //   "following": false
  // },
  // "favorited": false,
  // "favoritesCount": 0

  Article(this.title, this.slug, this.body, this.createdAt, this.updatedAt, this.description);

  factory Article.fromJson(Map<String, dynamic> article) =>
      Article(article['title'], article['slug'], article['body'], article['createdAt'], article['updatedAt'], article['description']);

  // Map toJson() => {'id': id, 'name': name};
}
