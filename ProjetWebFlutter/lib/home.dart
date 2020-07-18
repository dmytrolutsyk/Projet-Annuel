import 'package:flutter/material.dart';
import 'file:///C:/Users/rapha/OneDrive/Documents/Projet%20annuel/Projet-Annuel/ProjetWebFlutter/lib/service/apiService.dart';
import 'file:///C:/Users/rapha/OneDrive/Documents/Projet%20annuel/Projet-Annuel/ProjetWebFlutter/lib/model/annonces.dart';
import 'file:///C:/Users/rapha/OneDrive/Documents/Projet%20annuel/Projet-Annuel/ProjetWebFlutter/lib/items/annonceItems.dart';
import 'package:ProjetWebFlutter/newNotice.dart';
import 'package:ProjetWebFlutter/profil.dart';

void home(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
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
            ]
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(
                  'Toutes les annonces :',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
                ),
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
                      return SizedBox(
                        height: 1000,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(500,50, 500,0),
                          child: ListView.builder(
                            itemCount: annonces.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AnnonceItems(
                                annonce: annonces[index],
                              );
                            },
                          ),
                        ),
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