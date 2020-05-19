class Annonces {
  final title;
  final description;
  final category;
  final mail;
  final createdAt;
  final phoneNumber;
  final photos;
  final city;
  final lastUpdatedAt;

  Annonces(this.title, this.description, this.category, this.mail, this.createdAt, this.phoneNumber, this.photos, this.city, this.lastUpdatedAt) ;

  factory Annonces.fromJson(Map<String, dynamic> json) {
    return Annonces(
      json["title"],
      json["description"],
      json["category"],
      json["mail"],
      json["createdAt"],
      json["phoneNumber"],
      json["photos"],
      json["city"],
      json["lastUpdatedAt"]
    );
  }
}
