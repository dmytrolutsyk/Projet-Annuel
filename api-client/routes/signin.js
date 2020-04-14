var express = require('express');
var jwtUtils = require('../utils/jwt.utils');
var bcrypt = require('bcrypt');
var router = express.Router();
const {MongoClient} = require('../config');
const {MONGODB_URI} = require('../config');
const {dbName} = require('../config');

router.post('/', async function(req, res){
    //Params
    var username = req.body.username;
    var password = req.body.password;
    var user = null;
  
    //connecion bdd
    const client = new MongoClient(MONGODB_URI, {userNewUrlParser: true});
    await client.connect();
    const db = client.db(dbName);
    const col = db.collection('users');
    console.log('Connected\n');

    if (username == null || password == null){
        return res.status(400).json({ 'error' : 'missing parameters' });
    }else if(password.length <= 3) {
        return res.status(400).json({'error': 'Le mot de passe doit contenir au moins 4 caractères'});
    }else if(username.length <= 2 || username.length >= 21 ) {
        return res.status(400).json({'error': 'Votre identifiant doit contenir entre 2 et 20 caractères'});
    }

    let data = await col.find({}).toArray();
    if (data.some(data => data.username === req.body.username)) {
        console.log("ok")
        data.forEach(element => {
            if(element.username === req.body.username){
               
               user = element

               console.log(user)
            }
        });
        bcrypt.compare(password, user.password, function(errBycrypt, resBycrypt) {
            if (resBycrypt) {
                return res.status(200).json({
                    'UserId': user._id,
                    'token': jwtUtils.generateTokenForUser(user)
                });
            } else {
                return res.status(403).json({ "error": "invalid password"});
            }
        });
    }else {
            return res.status(403).json({ 'error': 'Cet identifiant est inconnu' });
        }
    });

  
  
  
  module.exports = {router};