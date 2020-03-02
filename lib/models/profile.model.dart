class Profile {
  String username;
  // "bio": null,
  String image;
  // "following": false

  Profile(this.username, this.image);

  factory Profile.fromJson(Map<String, dynamic> profile) =>
      Profile(profile['username'], profile['image']);
}