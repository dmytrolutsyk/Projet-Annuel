import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/apiService.dart';
import 'package:ProjetWebFlutter/annonces.dart';
import 'package:ProjetWebFlutter/annonceItems.dart';
import 'package:ProjetWebFlutter/newNotice.dart';
import 'package:ProjetWebFlutter/profil.dart';

void home(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Annonces'),
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
        body: ListView(
          children: <Widget>[
            Center(
              child: Text(
                'Toutes les annonces :',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
              ),
            ),
            FutureBuilder(
              future: ApiServices.getAnnonces(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }
                    if (snapshot.hasData) {
                      final List<Annonce> annonces = snapshot.data;
                      if (annonces.isEmpty) {
                        return Center(
                          child: Text("Empty list"),
                        );
                      }
                      return ListView.builder(
                        itemCount: annonces.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnnonceItem(
                            annonce: annonces[index],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text("No data"),
                      );
                    }
                    break;
                  default:
                    return Container();
                    break;
                }
              },
            )
          ],
        ),
      );
    },
  ));
}