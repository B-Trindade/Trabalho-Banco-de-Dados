const express = require('express');
const mysql = require('mysql');

//Creates connection
const connection = mysql.createConnection({
    host        :       'localhost',
    user        :       'root',
    database    :       'trabalho'
});

//Connect
connection.connect((err) => {
    if(err){
        console.log('Erro:' + err);
    }
    console.log('MySQL está conectado!');
});

const app = express();

//Create DB and initialize



app.listen('3000', () => {
    console.log('Servidor inicializado na porta 3000');
});
