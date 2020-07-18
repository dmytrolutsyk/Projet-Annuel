import 'package:flutter/material.dart';
import 'file:///C:/Users/rapha/OneDrive/Documents/Projet%20annuel/Projet-Annuel/ProjetWebFlutter/lib/model/annonces.dart';
import '../detailAnnonce.dart';
import 'file:///C:/Users/rapha/OneDrive/Documents/Projet%20annuel/Projet-Annuel/ProjetWebFlutter/lib/model/user.dart';

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