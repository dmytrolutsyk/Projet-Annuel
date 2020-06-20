import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/profil.dart';
import 'home.dart';



void NewNotice(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Ajouter une annonce'),
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
                  Navigator.pushNamed(context, '/signin');
                },
              )
            ],
            leading: IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Rechercher une annonce',
                onPressed: () {
                })),
        body: const Center(
          child: Text(
            'Ici il faudra un formulaire',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}