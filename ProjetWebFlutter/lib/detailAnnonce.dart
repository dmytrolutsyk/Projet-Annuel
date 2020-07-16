import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/profil.dart';
import 'home.dart';
import 'newNotice.dart';
import 'package:ProjetWebFlutter/annonces.dart';

void detailAnnonce(BuildContext context){
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text('Détail'),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  tooltip: 'Accueil',
                  onPressed: () {
                    home(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Créer une annonce',
                  onPressed: () {
                    NewNotice(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  tooltip: 'Profil',
                  onPressed: () {
                    profil(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings_power),
                  tooltip: 'Déconnexion',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                )
              ]
          ),
          body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Détail de l\'annonce',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )
          ),
      );
    },
  ));
}