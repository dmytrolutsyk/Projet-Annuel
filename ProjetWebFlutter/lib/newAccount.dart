import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void newAccount(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
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
                      'Inscription',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )
                ),
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
                  padding: EdgeInsets.fromLTRB(150, 30, 150, 20),
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
                            Navigator.pop(context, 'clc');
                            Fluttertoast.showToast(
                                msg: "Vous vous êtes inscrit",
                                timeInSecForIosWeb: 2,
                            );

                          },
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      }
  ));
}