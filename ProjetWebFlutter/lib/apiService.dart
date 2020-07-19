import 'dart:convert';

import 'annonces.dart';
import 'user.dart';
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

  /**static Future<http.Response> createAnnonce(String title, String description, String category, String type) async {
    final http.Response response = await http.post(
      'https://webhook.site/030ccf56-c5cf-4890-b93b-2e3bf2a236a5',
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
        'category': category,
        'type': type
      })
    );
    if(response.statusCode == 201) {
      return Annonce.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erreur');
    }
  }**/

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