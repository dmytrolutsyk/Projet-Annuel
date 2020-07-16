import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/annonces.dart';
import 'detailAnnonce.dart';

    class AnnonceItems extends StatelessWidget {
    final Annonce annonce;

    const AnnonceItems({
    Key key,
    this.annonce,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(annonce.title),
        subtitle: Text(annonce.description),
      ),
      onPressed: () {
        detailAnnonce(context);
      },
    );
  }
}