# Informations

Le serveur écoute sur le port 3000. Vous pouvez changer le port en modifiant la constante PORT.

# Prérequis

installer node
installer npm

# Pour récupérer le projet git : 
```
$ git clone https://github.com/dmytrolutsyk/Projet-node-ESGI.git
```

# Pour installer les dépendances :
```
$ npm install
```

# Pour lancer le projet :
```
$ npm start
```

# Principe de l'application :

Notre projet est une API réalisée en NodeJS communiquant avec une base de données noSQL. Cette API représente le back-end d'une application mobile et web.

# Différentes routes :

Pour chaque route citée un exemple de requête curl sera fournie. Nous partons du principe que l'application est déployée sur Heroku.

* Route /signin permettant à un utilisateur de se connecter.
	```
	$ curl -X POST --header "Content-Type: application/json" --data "{\"username\":\"YOUR_USERNAME\", \"password\":\"YOUR_PASSWORD\"}" https://localhost:3000/signin
	```
* Route /signup permettant à un utilisateur de s'inscrire.
	```
	$ curl -X POST --header "Content-Type: application/json" --data "{\"username\":\"YOUR_USERNAME\", \"password\":\"YOUR_PASSWORD\"}" https://localhost:3000/signup
	```
* Route /annonces permettant de :
	* Créer une annonce (put method, /annonces).
		```
		$ curl -X PUT --header "Content-Type: application/json" -H "Authorization: YOUR_TOKEN" --data "{\"content\":\"annonce content\"}" https://localhost:3000/annonces
		```
	* Récupérer toutes les annonces (get method) à partir de l'utilisateur (/annonces).
		```
		$ curl -X GET --header "Content-Type: application/json" -H "Authorization: YOUR_TOKEN" https://localhost:3000/annonces
		```
	* Modifier une annonce (patch method) depuis son ID (/annonces/:idannonce).
		```
		$ curl -X PATCH --header "Content-Type: application/json" -H "Authorization: YOUR_TOKEN" --data "{\"content\":\"annonce content\"}" https://localhost:3000/annonces/:idannonce
		```
	* Supprimer une annonce (delete method) depuis son ID (/annonces/:idannonce).
		```
		$ curl -X DELETE --header "Content-Type: application/json" -H "Authorization: YOUR_TOKEN" https://localhost:3000/annonces/:idannonce
		```

# Sources

* [Express](https://expressjs.com/en/api.html) - The web framework used.
* [JsonWebToken](https://github.com/auth0/node-jsonwebtoken) - Token authentification.
* [Heroku](https://dashboard.heroku.com/apps) - Deploy.
* [MongoDB](https://www.mongodb.com) - Database NoSQL.

# Collaborateurs

* LUTSYK Dmytro.
