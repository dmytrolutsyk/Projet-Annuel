var express = require('express');
var router = express.Router();
const {MongoClient} = require('../config');
const {MONGODB_URI} = require('../config');
const {dbName} = require('../config');
const {dateNow} = require('../config');
const {jwt} = require('../config');
const {JWT_SIGN_SECRET} = require('../config');
var ObjectId = require('mongodb').ObjectID;


/* GET annonces */
router.get('/', async function(req, res) {
    var token = req.get('Authorization');
    jwt.verify(token, JWT_SIGN_SECRET, async (err, data) => {
        
        if (err) {
            res.status(401).send('Utilisateur non connecté');
        } else {    
            console.log("gere")
            const client = new MongoClient(MONGODB_URI, {useNewUrlParser: true});
                try {
                    console.log("test");
                    await client.connect();
                    let userID =  data.userId;
                    console.log(userID)
                    console.log(data.username)
                    const db = client.db(dbName);
                    const col = db.collection('annonces');console.log('Connected\n');
                    //Display all datas of the collection
                    console.log('Displaying datas\n');
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
                client.close();
            
        }
    });
    
});

/* PUT A annonce */
router.put('/', async function(req, res) {
    var token = req.get('Authorization');
    jwt.verify(token, JWT_SIGN_SECRET, async (err, data) => {
        if (err) {
            res.status(401).send('Utilisateur non connecté');
        } else {    

            const client = new MongoClient(MONGODB_URI, {useNewUrlParser: true});

                await client.connect();
                const db = client.db(dbName);
                const col = db.collection('annonces');
                console.log('Connected\n');
                
                //INSERT ONE DOCUMENT
                let userID = data.userId;

                let content = req.body.content;

                console.log(content);
                console.log(userID);
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
        
                client.close();
        }
    });

});

/* Patch A annonce */
router.patch('/:id', async function(req, res) {
    var token = req.get('Authorization');
    jwt.verify(token, JWT_SIGN_SECRET, async (err, data) => {
        if (err) {
            res.status(401).send('Utilisateur non connecté');
        } else {

            const client = new MongoClient(MONGODB_URI, {useNewUrlParser: true});
            await client.connect();
            const db = client.db(dbName);
            const col = db.collection('annonces');
            console.log('Connected\n');

            let content = req.body.content;

            let lastUpdatedAt = dateNow();

            if(content.length === 0){
                res.status(400).send({error: 'Aucun contenu n\'a été saisi'});
            } else {
                const annonce = await col.findOne({_id: ObjectId(req.params.id)});
                if (!annonce){
                    res.status(400).send({error: 'Aucune annonce n\'a été trouvee'});
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

            client.close();

        }
    });
});


/* Delete A annonce */
router.delete('/:id', async function(req, res) {
    var token = req.get('Authorization');
    jwt.verify(token, JWT_SIGN_SECRET, async (err, data) => {
        if (err) {
            res.status(401).send('Utilisateur non connecté');
        } else {
            const client = new MongoClient(MONGODB_URI, {useNewUrlParser: true});
            try {
                await client.connect();
                const db = client.db(dbName);
                const col = db.collection('annonces');
                //DELETE ONE DOCUMENT
                let id_annonce = req.params.id;
                let annonceResults = await col.find().toArray();
                let resultForEach = 0;
                console.log("annonces",annonceResults);
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
            client.close();
        }
    });
});


module.exports = {router};