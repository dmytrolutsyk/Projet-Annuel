import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/annonces.dart';

class AnnonceItem extends StatelessWidget {
  final Annonces annonces;

  const AnnonceItem({
    Key key,
    this.annonces,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text("${annonces.title}"),
      subtitle: Text(annonces.category),
    );
  }
}