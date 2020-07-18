import 'dart:convert';

import 'file:///C:/Users/rapha/OneDrive/Documents/Projet%20annuel/Projet-Annuel/ProjetWebFlutter/lib/model/annonces.dart';
import 'file:///C:/Users/rapha/OneDrive/Documents/Projet%20annuel/Projet-Annuel/ProjetWebFlutter/lib/model/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Annonce>> getAnnonces() async {
    final response =
    await http.get("https://next.json-generator.com/api/json/get/4yxRZ-nJt");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);

    final List<Annonce> annonces = [];
    annonces.addAll((jsonBody as List).map((annonce) => Annonce.fromJson(annonce)).toList());

    return annonces;
  }

  static Future<List<User>> getUser() async {
    final response =
    await http.get("https://next.json-generator.com/api/json/get/NJ7BTZ3yY");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);

    final List<User> users = [];
    users.addAll((jsonBody as List).map((user) => User.fromJson(user)).toList());

    return users;
  }
}