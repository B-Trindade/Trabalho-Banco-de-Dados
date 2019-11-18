const express = require('express');
const mysql = require('mysql');

const app = express();

app.listen('3000', () => {
    console.log('Servidor inicializado na porta 3000');
});
