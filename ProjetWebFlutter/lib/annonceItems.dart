import 'package:flutter/material.dart';
import 'annonces.dart';
import 'detailAnnonce.dart';
import 'user.dart';
import 'dart:convert' show json, base64, ascii;

class AnnonceItems extends StatelessWidget {
    final Annonce annonce;
    final User user;

    const AnnonceItems({
      Key key,
      this.annonce,
      this.user
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 600,
      child: RaisedButton(
        color: Colors.white,
        child: ListTile(
          leading: Image.network(annonce.photos),
          title: Text(annonce.title),
          subtitle: Text(
            annonce.type,
          ),
        ),
        onPressed: () {
          detailAnnonce(context, annonce);
        },
      ),
    );
  }
}