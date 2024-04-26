const express = require('express');
const router = express.Router();
const path = require('path');
const db = require('../models/database');

// Rota GET para cursos
router.get('/curso', (req, res) => {
    
    let id = parseInt(req.query.id);
    console.log("Recebi uma request GET");

    for(let i = 0; i<10; i++){
        if (id==db.cursos[i].id){
            res.send(`CURSO ID: ${db.cursos[i].id}
                      Nome do curso: ${db.cursos[i].nome}
                      Turno do curso: ${db.cursos[i].turno}
                      Campus do curso: ${db.cursos[i].id_campus}`);
            break;
        }else{
            res.send("Curso não encontrado!");
            break;
        }
    }
});

// Rota POST para cursos
router.post('/curso', (req, res) => {
    
    console.log("Recebi um POST");

    let id_ = parseInt(req.body.id);
    let nome_ = req.body.nome;
    let turno_ = parseInt(req.body.turno);
    let id_campus_ = parseInt(req.body.id_campus);

    db.cursos.push({id: id_,
                    nome: nome_,
                    turno: turno_,
                    id_campus: id_campus_,
    });

    res.send("Curso cadastrado com sucsso!");

})

// Rota DELETE para cursos
router.delete('/curso', (req, res) => {
    
    console.log("Recebi um delete!");
    let id = req.query.id;
    let count = 0;

    for(let i = 0; i>=0; i++){

        if (id==db.cursos[i].id){
            break;
        }
        count++;
    }

    db.cursos.splice(count, 1);
    res.send("Curso removido com sucesso");

})

// Rota PUT para cursos
router.put('/curso', (req, res) => {
    let id_ = req.body.id;
    let count = 0;

    for(let i = 0; i<20; i++){

        if (id_==db.cursos[i].id){
            break;
        }
        count++;
    }

    db.cursos[count] = {
        id:id_,
        nome:req.body.nome,
        turno: req.body.turno,
        id_campus: req.body.id_campus,
    }

    res.send("Curso atualizado com sucsso!!")
})

router.get('/ccr', (req, res) => {
    
    let id = req.query.id;
    console.log("Recebi uma request GET");

    for(let i = 0; i<10; i++){
        if (id==db.ccrs[i].id){
            res.send(`ID do CCR: ${db.ccrs[i].id}
                      Nome do CCR: ${db.ccrs[i].nome}`)
        break;}
    }
});

router.post('/ccr', (req, res) => {
    
    console.log("Recebi um POST");

    let id_ = req.body.id;
    let nome_ = req.body.nome;


    db.ccrs.push({id: id_,
                  nome: nome_,
    });

    res.send("CCR cadastrado com sucsso!");

})

router.delete('/ccr', (req, res) => {
    
    console.log("Recebi um delete!");
    let id = req.query.id;
    let count = 0;

    for(let i = 0; i>=0; i++){

        if (id==db.ccrs[i].id || i==10){
            break;
        }
        count++;
    }

    db.ccrs.splice(count, 1);
    res.send("CCR removido com sucesso");

})

router.put('/ccr', (req, res) => {
    let id_ = req.body.id;
    let count = 0;

    for(let i = 0; i<20; i++){

        if (id_==db.ccrs[i].id){
            break;
        }
        count++;
    }

    db.ccrs[count] = {
        id:id_,
        nome:req.body.nome,
    }

    res.send("CCR atualizado com sucsso!!")
})

module.exports = router;
