const MONGODB_URI = process.env.MONGODB_URI || "mongodb+srv://admin:<password>@cluster0-sluc0.azure.mongodb.net/test?retryWrites=true&w=majority";
const PORT = process.env.PORT || 3000;
const dbName = process.env.DBNAME || 'annonces-api';

const MongoClient = require('mongodb').MongoClient;
const ObjectId = require('mongodb').ObjectId;
const JWT_SIGN_SECRET ='jfsjdJBDF56JB546J588hjbhjb7HBJ';
var jwt = require('jsonwebtoken');

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

module.exports = {
    ObjectId,
    MongoClient,
    MONGODB_URI,
    dbName,
    PORT,
    dateNow,
    JWT_SIGN_SECRET,
    isUsernameValid,
    jwt
};