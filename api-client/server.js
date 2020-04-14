const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const MongoClient = require('mongodb').MongoClient;
const { ObjectId } = require('mongodb').ObjectId;
const assert = require('assert');
const MONGODB_URI = process.env.MONGODB_URI || "mongodb+srv://root:root@cluster0-0vedk.mongodb.net/test?retryWrites=true&w=majority";
const PORT = process.env.PORT || 3000;
const client = new MongoClient( MONGODB_URI, { useNewUrlParser: true });
var db;
const app = express();
const url = process.env.MONGODB_URI || 'mongodb://localhost:' + 27017 + '/annonces';
const dbName = "annonces";
const JWT_SIGN_SECRET ='secret';

function generateTokenForUser(userData) {
    return jwt.sign({
        userId: userData._id,
        username: userData.username,
        password: userData.password
    },
    JWT_SIGN_SECRET,
    {
        expiresIn: '24h'
    })
}

function dateNow(){
    var dateNow = new Date();
    var day = dateNow.getDate();
    var month = dateNow.getMonth();
    var year = dateNow.getFullYear();
    var hour = dateNow.getHours();
    var minutes = dateNow.getMinutes();
    var seconds = dateNow.getSeconds();
    month += 1;
    const dateFormatted = formatDigits(day) + '/' + formatDigits(month) + '/' + year + ' ' + formatDigits(hour) + ':' + formatDigits(minutes) + ':' + formatDigits(seconds);
    return dateFormatted;
}

function formatDigits(number){
    if(number < 10) {
        number = ('0' + number);
    }
    return number;
}

function isUsernameValid(str){
    if(typeof(str)!== 'string'){
        return false;
    }
    for(var i=0;i<str.length;i++){
        if(str.charCodeAt(i)>122 || str.charCodeAt(i)<97){
            return false;
        }
    }
    return true;
} 


(async function() {
    try {
       var connected = await client.connect();
       db = connected.db('annonces-api');
    } catch (err) { console.log(err.stack); }
    })();

    

    app.listen(PORT, function () {
        console.log('Example app listening on port ', PORT)
    })

  app.use(express.json());

  app.get('/', (req, res) => {
    res.send('Hello World!');
  });

  app.post('/signup', async function(req, res){
    // Params
    let username = req.body != undefined? req.body.username : null;
    let password = req.body != undefined? req.body.password : null;
    const col = db.collection('users');
  
    if (password == null /*|| passwordOk == null*/) {
        return res.status(400).json({'error': 'Le mot de passe doit contenir au moins 4 caractères', 'token': undefined});
    } else if (!username) {
        return res.status(400).json({'error': 'Votre identifiant doit contenir entre 2 et 20 caractères', 'token': undefined});
    }else if(password.length <= 3) {
        return res.status(400).json({'error': 'Le mot de passe doit contenir au moins 4 caractères', 
        'token': undefined});
    }else if(username.length <= 2 || username.length >= 21 ) {
        return res.status(400).json({'error': 'Votre identifiant doit contenir entre 2 et 20 caractères',
        'token': undefined});
    }else if(!isUsernameValid(username)) {
        return res.status(400).json({'error': 'Votre identifiant ne doit contenir que des lettres minuscules non accentuées',
        'token': undefined});
    }
    
    let data = await col.find({}).toArray();
    if (data.some(data => data.username === req.body.username)) {
        return res.status(400).json({ 'error': 'Cet identifiant est déjà associé à un compte',
        'token': undefined});
    } else {
        bcrypt.hash(password, 5, function(err, bcryptedpassword){
            let user = {
                username: username,
                password: bcryptedpassword,
            };
            col.insertOne(user, (err, result) => {
                if (err) {
                    return res.status(500).json({ 'error': 'cannot add user'});
                } else {
                    //resolve({ data: { createdId: result.insertedId }, statusCode: 201 });
                    user._id = result.insertedId;
                    return res.status(200).json({ 'createdId': result.insertedId, 'error': null, 
                    'token': generateTokenForUser(user)  })
                }
            });
        });

    }
});

  /* GET annonceS */
  app.get('/annonces', async function(req, res) {
    var token = req.get('x-access-token');
    jwt.verify(token, JWT_SIGN_SECRET, async (err, data) => {
        if (err) {
            res.status(401).send('Utilisateur non connecté');
        } else {
                try {
                    let userID =  data.userId;
                    const col = db.collection('annonces');
                    let results = await col.find({ userID: userID}).sort({ _id: -1}).toArray();
                    res.send({
                        error: null,
                        annonces: results
                    });
                } catch (err) {
                    res.send({
                        error: err
                    });
                }            
        }
    });
    
});

/* PUT A annonce */
app.put('/annonces', async function(req, res) {
    var token = req.get('x-access-token');
    jwt.verify(token, JWT_SIGN_SECRET, async (err, data) => {
        if (err) {
            res.status(401).send('Utilisateur non connecté');
        } else {    
                const col = db.collection('annonces');   
                //INSERT ONE DOCUMENT
                let userID = data.userId;
                let content = req.body.content;
                let createdAt = dateNow();
                let lastUpdatedAt = null;
                if(content.length === 0){
                    res.status(400).send({error: 'Aucun contenu n\'a été saisi'});
                } else {
                    let resInsert = await col.insertOne({
                        userID,
                        content,
                        createdAt,
                        lastUpdatedAt
                    });
                    let annonce = resInsert.ops[0];
                    res.send({
                        error: null,
                        annonce
                    });
                }
        }
    });

});

/* Patch A annonce */
app.patch('/annonces/:id', async function(req, res) {
    var token = req.get('x-access-token');
    jwt.verify(token, JWT_SIGN_SECRET, async (err, data) => {
        if (err) {
            res.status(401).send('Utilisateur non connecté');
        } else {
            const col = db.collection('annonces');
            let content = req.body.content;
            let lastUpdatedAt = dateNow();
            if(content.length === 0){
                res.status(400).send({error: 'Aucun contenu n\'a été saisi'});
            } else {
                const annonce = await col.findOne({_id: ObjectId(req.params.id)});
                const user = await db.collection('users').findOne({ _id: ObjectId(data.userId) });
                if (!annonce){
                    res.status(404).send({error: 'Cet identifiant est inconnu'});
                    return;
                }
                if (annonce.userID.toString() !== user._id.toString()) {
                    res.status(403).json({ error: "Accès non autorisé à cette annonce" });
                  } else {
                    await col.updateOne(
                        {_id: ObjectId(req.params.id)},
                        {$set: {content: req.body.content, lastUpdatedAt: lastUpdatedAt}}
                    );
                    const newannonce = await col.findOne({_id: ObjectId(req.params.id)});
                    res.status(200).send({
                        error: null,
                        annonce: newannonce
                    });
                }
            }
        }
    });
});


/* Delete A annonce */
app.delete('/annonces/:id', async function(req, res) {
    var token = req.get('x-access-token');
    jwt.verify(token, JWT_SIGN_SECRET, async (err, data) => {
        if (err) {
            res.status(401).send('Utilisateur non connecté');
        } else {
            try {
                const col = db.collection('annonces');
                //DELETE ONE DOCUMENT
                let id_annonce = req.params.id;
                let annonceResults = await col.find().toArray();
                let resultForEach = 0;
                
                let annonceToBeDeleted;
                annonceResults.forEach(function (resForEach) {
                    if(resForEach._id.equals(id_annonce)){
                        resultForEach = 1;
                        annonceToBeDeleted = resForEach;
                    }
                });
                if(resultForEach === 0) {
                    res.status(404).send({error: 'Cet identifiant est inconnu'});
                } else if(annonceToBeDeleted.userID !== data.userId){
                    res.status(403).send({error: 'Accès non autorisé à cette annonce'})
                } else {
                    await col.deleteOne({_id: annonceToBeDeleted._id});
                    res.send({
                        error: null
                    });
                }
            } catch (err) {
                res.send({
                    error: err
                });
            }
        }
    });
});

app.post('/signin', async function(req, res){
    //Params
    var username = req.body.username;
    var password = req.body.password;
    var user = null;
  
    const col = db.collection('users');

    if (password == null){
        return res.status(400).json({'error': 'Le mot de passe doit contenir au moins 4 caractères', 'token': undefined});
    } else if(!username){
        return res.status(400).json({'error': 'Votre identifiant doit contenir entre 2 et 20 caractères', 'token': undefined});
    }else if(password.length <= 3) {
        return res.status(400).json({'error': 'Le mot de passe doit contenir au moins 4 caractères'});
    }else if(username.length <= 2 || username.length >= 21 ) {
        return res.status(400).json({'error': 'Votre identifiant doit contenir entre 2 et 20 caractères'});
    }else if(!isUsernameValid(username)) {
        return res.status(400).json({'error': 'Votre identifiant ne doit contenir que des lettres minuscules non accentuées',
        'token': undefined});
    }

    let data = await col.find({}).toArray();
    if (data.some(data => data.username === req.body.username)) {
        
        data.forEach(element => {
            if(element.username === req.body.username){              
               user = element
            }
        });
        bcrypt.compare(password, user.password, function(errBycrypt, resBycrypt) {
            if (resBycrypt) {
                return res.status(200).json({
                    'error': null,
                    'UserId': user._id,
                    'token': generateTokenForUser(user)
                });
            } else {
                return res.status(403).json({ "error": "Cet identifiant est inconnu"});
            }
        });
    }else {
            return res.status(403).json({ 'error': 'Cet identifiant est inconnu' });
        }
    });

