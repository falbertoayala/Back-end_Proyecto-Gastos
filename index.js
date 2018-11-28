var express = require('express');
var cors = require('cors');
var bodyParser = require('body-parser');
var app = express();
var sql = require('mssql');
var path = require('path');
var env = require('dotenv');
var multer = require('multer');

const result = env.config();
app.use(cors());
app.use(bodyParser());

app.use(function(err,req,res,next){
    console.error(err);
    res.send({success:false, message :err})

})


const sqlConfig ={
    user : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    server : process.env.DB_SERVER,
    database : process.env.DB_DATABASE,
    port : parseInt(process.env.DB_PORT),
    debug : true,
    options : {
        encrypt:false,
        instanceName : process.env.DB_INSTACE
    }
    

};


app.listen(parseInt(process.env.APP_PORT), function(){
    console.log("El Servidor esta corriendo");
    console.log(result.parsed);
    console.log(sqlConfig);
});


require("./users")(app, sql, sqlConfig);