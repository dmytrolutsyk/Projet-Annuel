import 'dart:convert';

import 'package:ProjetWebFlutter/annonces.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Annonces>> getAnnonces() async {
    final response =
    await http.get("https://findandtrade.herokuapp.com/annonces");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<Annonces> annonces = [];
    annonces.addAll((jsonBody as List).map((annonces) => Annonces.fromJson(annonces)).toList());

    return annonces;
  }
}