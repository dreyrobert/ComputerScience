// const db = require('./models/database');
const express = require('express');
const bodyParser = require("body-parser")
const path = require('path');

const app = express();
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

const homepageController = require('./controllers/homepageController.js');
const apiController = require('./controllers/apiController.js'); // Importe o apiController aqui

app.get('/', homepageController.index);
app.use('/api', apiController); // Use o apiController com o prefixo '/api' para as rotas da API

const PORT = 3001;
app.listen(PORT, () => console.log(`Servidor iniciado na porta ${PORT}`));
