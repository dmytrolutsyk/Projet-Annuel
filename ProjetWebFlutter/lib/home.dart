import 'package:ProjetWebFlutter/main.dart';
import 'package:flutter/material.dart';
import 'apiService.dart';
import 'annonces.dart';
import 'annonceItems.dart';
import 'package:ProjetWebFlutter/newNotice.dart';
import 'package:ProjetWebFlutter/profil.dart';
import 'dart:convert' show json, base64, ascii;
import 'package:http/http.dart' as http;
import 'main.dart';

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

/**class home extends StatelessWidget {
  home(this.jwt, this.payload);

  factory home.fromBase64(String jwt) =>
      home(
        jwt,
        json.decode(
            ascii.decode(
                base64.decode(
                    base64.normalize(jwt.split(".")[1]))))
      );


  @override
  Widget build(BuildContext context) {
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
          FutureBuilder(
            future: http.read('$SERVER_IP/data', headers: {"Authorization": jwt}),
            builder: (context, snapshot) =>
            snapshot.hasData ?
            Column(
              children: <Widget>[
                Text("${payload['username']}, here's the data")
              ],
            ) : snapshot.hasError ? Text("An error occurred") : CircularProgressIndicator()
          ),
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
  }

  final String jwt;
  final Map<String, dynamic> payload;
}**/


