import 'package:flutter/cupertino.dart';

class Annonce {
  final String title;
  final String description;
  final String category;
  final String mail;
  final DateTime createdAt;
  final int phoneNumber;
  final FileImage photos;
  final String city;
  final DateTime lastUpdatedAt;

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
