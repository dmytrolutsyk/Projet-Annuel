import 'dart:convert';

import 'package:ProjetWebFlutter/annonces.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Annonce>> getAnnonces() async {
    final response =
    await http.get("https://next.json-generator.com/api/json/get/NytbBue1F");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    print(jsonBody);
    final List<Annonce> annonces = [];
    annonces.addAll((jsonBody as List).map((annonce) => Annonce.fromJson(annonce)).toList());

    return annonces;
  }
}