import 'package:flutter/material.dart';
import 'package:ProjetWebFlutter/newAccount.dart';
import 'home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/signin',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/signin': (_) => MyHomePage(),
        },
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
          automaticallyImplyLeading: false,
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
                          child: Text('Valider'),
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
                            newAccount(context);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}