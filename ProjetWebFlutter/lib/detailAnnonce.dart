import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/profil.dart';
import 'home.dart';
import 'newNotice.dart';
import 'annonces.dart';


void detailAnnonce(BuildContext context, Annonce annonce){
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
          body: Padding(
            padding: EdgeInsets.all(50),
            child: ListView(
              children: <Widget>[
                Container(
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
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "Nom de l'article : " + annonce.title,
                        style: TextStyle(
                          fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Image.network(
                          annonce.photos,
                        scale: 2,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Description du produit : " + annonce.description +
                          "\n\nCatégorie du produit : " + annonce.category +
                          "\n\nCe produit est de type : " + annonce.type +
                          "\n\nCe produit à été ajouté le : " + annonce.createdAt,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      );
    },
  ));
}

/**class detailAnnonce extends StatelessWidget {
  final Annonce annonce;
  final String jwt;

  const detailAnnonce({
    Key key,
    this.annonce,
    this.jwt
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Détail'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Accueil',
              onPressed: () {
                home((context));
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
      body: Padding(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: <Widget>[
            Container(
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
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "Nom de l'article : " + annonce.title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Image.network(
                    annonce.photos,
                    scale: 2,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Description du produit : " + annonce.description +
                      "\n\nCatégorie du produit : " + annonce.category +
                      "\n\nCe produit est de type : " + annonce.type +
                      "\n\nCe produit à été ajouté le : " + annonce.createdAt,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}**/
