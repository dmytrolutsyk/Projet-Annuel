var express = require('express');
var router = express.Router();
const {MongoClient} = require('../config');
const {MONGODB_URI} = require('../config');
const {dbName} = require('../config');
const {isUsernameValid} = require('../config');
var bcrypt = require('bcrypt');
var jwtUtils = require('../utils/jwt.utils');

router.post('/', async function(req, res){
    // Params
    var username = req.body.username;
    var password = req.body.password;
  
    //connecion bdd
    const client = new MongoClient(MONGODB_URI, {userNewUrlParser: true});
    await client.connect();
    const db = client.db(dbName);
    const col = db.collection('users');
    console.log('Connected\n');
  
    if (username == null || password == null /*|| passwordOk == null*/) {
        return res.status(400).json({'error': 'missing parameters'});
    }else if(password.length <= 3) {
        return res.status(400).json({'error': 'Le mot de passe doit contenir au moins 4 caractères', 
        'token': 'undefined'});
    }else if(username.length <= 2 || username.length >= 21 ) {
        return res.status(400).json({'error': 'Votre identifiant doit contenir entre 2 et 20 caractères',
        'token': 'undefined'});
    }else if(!isUsernameValid(username)) {
        return res.status(400).json({'error': 'Votre identifiant ne doit contenir que des lettres minuscules non accentuées',
        'token': 'undefined'});
    }
    
    let data = await col.find({}).toArray();
    console.log(data)
    if (data.some(data => data.username === req.body.username)) {
        return res.status(400).json({ 'error': 'Cet identifiant est déjà associé à un compte',
        'token': 'undefined'});
    } else {
        bcrypt.hash(password, 5, function(err, bcryptedpassword){
            let user = {
                username: username,
                password: bcryptedpassword,
            };
            col.insertOne(user, (err, result) => {
                if (err) {
                    console.log(err)
                    return res.status(500).json({ 'error': 'cannot add user'});
                } else {
                    //resolve({ data: { createdId: result.insertedId }, statusCode: 201 });
                    user._id = result.insertedId;
                    console.log(user._id);
                    return res.status(200).json({ 'createdId': result.insertedId, 'error': null, 
                    'token': jwtUtils.generateTokenForUser(user)  })
                }
            });
        });

    }
    });

  module.exports = {router};