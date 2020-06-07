import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/apiService.dart';
import 'package:ProjetWebFlutter/annonces.dart';
import 'package:ProjetWebFlutter/annonceItems.dart';
import 'package:ProjetWebFlutter/newNotice.dart';
import 'package:ProjetWebFlutter/profil.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Find & Trade',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(
          title: 'Find & Trade',
        ));
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Find and trade')),
        ),
        body: Padding(
            padding: EdgeInsets.all(50),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(150, 30, 150, 20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom d\'utilisateur',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(150, 10, 150, 20),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mot de passe',
                    ),
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
                          child: Text('Validé'),
                          onPressed: () {
                            print(nameController.text);
                            print(passwordController.text);
                            home(context);
                          },
                        ),
                      )),
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Vous n\'avez pas de compte ?'),
                        FlatButton(
                          textColor: Colors.green,
                          child: Text(
                            'S\'inscrire',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}

  void home(BuildContext context) {
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
                  'Toute les annonces :',
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
              ),
            ],
          ),
        );
      },
    ));
  }
