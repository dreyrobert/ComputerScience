const express = require('express');
const router = express.Router();
const path = require('path');

const pgp = require("pg-promise")({});

const usuario = "postgres";
const senha = "postgres";
const db = pgp(`postgres://${usuario}:${senha}@localhost:5432/agenda`);

// Rota GET para cursos
router.get("/cursos", async (req, res) => {
    try {
        const cursos = await db.any("SELECT idc as id, nome as nome, descr as desc FROM cursos;");
        console.log('Retornando todos cursos.');
        res.json(cursos).status(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

router.get("/horarios", async (req, res) => {
    try {
        const horarios = await db.any("SELECT c.idc as curso, d.nome, h.hora, d.fase, d.idd as id FROM disciplina d JOIN cursos c ON d.idc = c.idc JOIN horarios h ON h.idh = d.idh;");
        console.log('Retornando todos horários.');
        res.json(horarios).status(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

router.get("/horarios2", async (req, res) => {
    try {
        const horarios = await db.any("SELECT * FROM horarios;");
        console.log('Retornando todos horários2.');
        res.json(horarios).status(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

router.post('/follow', (req, res) => {
    
    console.log("Recebi um Follow");
})

router.post('/unfollow', (req, res) => {
    
    console.log("Recebi um Unfollow");
})

router.post("/cursos", async (req, res) => {
    try {
        const cursoNome = req.body.nome;
        const cursoId = req.body.id;
        const cursoDesc  = req.body.desc;

        db.none(
            "INSERT INTO cursos (idc, nome, descr) VALUES ($1, $2, $3);",
            [cursoId, cursoNome, cursoDesc]
        );

        res.sendStatus(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

router.post("/horarios2", async (req, res) => {
    try {
        const horarioHora = req.body.hora;

        await db.none(
            "INSERT INTO horarios (hora) VALUES ($1);",
            horarioHora // Envolve horarioHora em um array
        );

        res.sendStatus(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});


module.exports = router;