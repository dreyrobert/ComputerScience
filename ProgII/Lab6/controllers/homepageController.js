// homepageController.js

const path = require('path');

// Define a função index
const index = (req, res) => {
    // Calcula o caminho absoluto para o arquivo 'index.html'
    const indexPath = path.join(__dirname, '../public/index.html');
    
    // Envia o arquivo 'index.html'
    res.sendFile(indexPath);
};

// Outras funções do controller, se houver...

// Exporta a função index para que possa ser usada em outros arquivos
module.exports = {
    index: index,
    // Outras funções do controller, se houver...
};
