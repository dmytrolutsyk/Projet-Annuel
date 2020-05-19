class Annonce {
  final title;
  final description;
  final category;
  final mail;
  final createdAt;
  final phoneNumber;
  final photos;
  final city;
  final lastUpdatedAt;

  Annonce(this.title, this.description, this.category, this.mail, this.createdAt, this.phoneNumber, this.photos, this.city, this.lastUpdatedAt) ;

  factory Annonce.fromJson(Map<String, dynamic> json) {
    return Annonce(
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
