import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/annonces.dart';

    class AnnonceItem extends StatelessWidget {
    final Annonce annonce;

    const AnnonceItem({
    Key key,
    this.annonce,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text("${annonce.title}"),
      subtitle: Text("${annonce.description}"),
    );
  }
}