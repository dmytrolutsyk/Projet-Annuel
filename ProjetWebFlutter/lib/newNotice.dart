import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/profil.dart';
import 'home.dart';
import 'image.dart';



void NewNotice(BuildContext context) {
  TextEditingController labelAnnonce = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController categorie = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  List<String> _locations = ['Echanges', 'Dons']; // Option 2
  String _selectedLocation; // Option 2
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
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
                    'Nouvelle annonce',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(150, 30, 150, 20),
                child: TextField(
                  controller: labelAnnonce,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Titre',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(150, 30, 150, 20),
                child: TextField(
                  controller: categorie,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Catégorie de l\'annonce (Echanges/Dons)',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(150, 30, 150, 20),
                child: TextField(
                  controller: description,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(150, 30, 150, 20),
                child: TextField(
                  controller: imageUrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Url de l\'image',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(500, 30, 500, 20),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    startWebFilePicker();
                  },
                  label: Text("Choisir une image"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Center(
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text('Ajouter'),
                        onPressed: () {

                        },
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    },
  ));
}