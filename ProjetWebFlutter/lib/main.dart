import 'package:flutter/material.dart';

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
      )

    );
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
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Créer une annonce',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Paramètres',
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Rechercher une annonce',
          onPressed: () {
            }
        )
      ),
      body:  Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Toute les annonces :'),
            ),
            ListTile(
              title: Text('Annonce 1'),

            ),
            ListTile(
              title: Text('Annonce 2'),
            ),
            ListTile(
              title: Text('Annonce 3'),
            ),
          ],
        ),
      ),
    );
  }
}