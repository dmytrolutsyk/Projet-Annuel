import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/apiService.dart';
import 'package:ProjetWebFlutter/annonces.dart';
import 'package:ProjetWebFlutter/annonceItems.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Accueil',
              onPressed: () {
                _MyHomePageState();
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Créer une annonce',
              onPressed: () {
                _NewNotice(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              tooltip: 'Profil',
              onPressed: () {
                _profil(context);
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
          ListTile(
            title: Center(child: Text('Annonce 1')),
          ),
          ListTile(
            title: Center(child: Text('Annonce 2')),
          ),
          ListTile(
            title: Center(child: Text('Annonce 3')),
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
                    final List<Annonces> annonces = snapshot.data;
                    if (annonces.isEmpty) {
                      return Center(
                        child: Text("Empty list"),
                      );
                    }
                    return ListView.builder(
                      itemCount: annonces.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnnonceItem(
                          annonces: annonces[index],
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
  }
}

void _NewNotice(BuildContext context) {
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
                  _home(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Créer une annonce',
                onPressed: () {
                  _NewNotice(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                tooltip: 'Profil',
                onPressed: () {
                  _profil(context);
                },
              ),
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


void _home(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Find & Trade'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'Accueil',
                onPressed: () {
                  _home(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Créer une annonce',
                onPressed: () {
                  _NewNotice(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                tooltip: 'Profil',
                onPressed: () {
                  _profil(context);
                },
              ),
            ],
            leading: IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Rechercher une annonce',
                onPressed: () {
                })),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(

                    title: Center(
                      child: Text(
                        'Toute les annonces :',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text('Annonce 1')),
                  ),
                  ListTile(
                    title: Center(child: Text('Annonce 2')),
                  ),
                  ListTile(
                    title: Center(child: Text('Annonce 3')),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  ));
}


void _profil(BuildContext context) {
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
                  _home(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Créer une annonce',
                onPressed: () {
                  _NewNotice(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                tooltip: 'Profil',
                onPressed: () {
                  _profil(context);
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
            ListTile(
              title: Text("Se connecter"),
            ),
            ListTile(
              title: Text("S'inscrire"),
            ),
            Icon(
              Icons.account_circle,
            )
          ],
        ),
      );
    },
  ));
}


