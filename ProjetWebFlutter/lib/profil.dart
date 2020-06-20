import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/newNotice.dart';
import 'home.dart';



void profil(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Profil'),
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
          body: Center(
            child: CalendarDatePicker(
              initialDate: (DateTime.now()),
              firstDate: DateTime(2015),
              lastDate: DateTime(2030),
              onDateChanged: (DateTime value) {  },

            ),
          )
      );
    },
  ));
}