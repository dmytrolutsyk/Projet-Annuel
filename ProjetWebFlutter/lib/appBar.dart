import 'package:flutter/material.dart';

class barNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(
          "Find & trade",
        ),
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
              MyHomePage();
            },
          ),
        ],
        leading: IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Rechercher une annonce',
            onPressed: () {}));
  }
}





