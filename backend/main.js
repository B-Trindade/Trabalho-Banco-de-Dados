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

//Creates DB and calls for init
app.get('/createdb', (req, res) => {
    let MySQL = 'CREATE DATABASE trabalho';
    connection.query(MySQL, (err, result) => {
        if(err) {
            console.error(err);
        }
        res.send('Database created!');
    });
});

app.get('/initdb', (req, res) => {
    let MySQL = 'source init.sql';
    connection.query(MySQL, (err, result) => {
        if(err) console.error(err);
        res.send('Database initialized!');
    });
});

app.listen('8081', () => {
    console.log('Servidor inicializado na porta 8081');
});

