const express = require('express');
const bodyParser = require("body-parser");
const path = require('path');
const cors = require('cors');


const app = express();
app.use(cors());

app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

const apiController = require('./controllers/apiController.js');

app.use('/api', apiController);

const PORT = process.env.PORT || 3001; // Usar a porta definida pelo ambiente ou a porta 3001 por padrão
app.listen(PORT, () => console.log(`Servidor iniciado na porta ${PORT}`));
