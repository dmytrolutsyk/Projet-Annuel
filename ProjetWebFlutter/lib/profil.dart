import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/newNotice.dart';
import 'home.dart';
import 'dart:html';
import 'image.dart';



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
                  Navigator.pushReplacementNamed(context, '/signin');
                },
              )
            ],
            leading: IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Rechercher une annonce',
                onPressed: () {
                })),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Container(
                  height: 290.0,
                  width: 290.0,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      startWebFilePicker();
                    },
                    icon: Icon(
                        Icons.account_circle,
                      size: 80,
                    ),
                    shape: RoundedRectangleBorder(),
                    label: Text("Choisir une photo de profil"),
                  ),
                ),
              ),
            ],
          )
      );
    },
  ));
}




