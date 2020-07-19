import 'package:flutter/cupertino.dart';

class Annonce {
  final String title;
  final String description;
  final String category;
  final String type;
  final String createdAt;
  final String photos;
  final String lastUpdatedAt;

  Annonce(this.title, this.description, this.category, this.type ,this.createdAt, this.photos, this.lastUpdatedAt) ;

  factory Annonce.fromJson(Map<String, dynamic> json) {
    return Annonce(
      json["title"],
      json["description"],
      json["category"],
      json["type"],
      json["createdAt"],
      json["photos"],
      json["lastUpdatedAt"]
    );
  }
}

