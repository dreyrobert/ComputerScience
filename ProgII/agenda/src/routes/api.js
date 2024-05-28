const express = require('express');
const router = express.Router();
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
    // Implemente a lógica para seguir um usuário
});

router.post('/unfollow', (req, res) => {
    console.log("Recebi um Unfollow");
    // Implemente a lógica para deixar de seguir um usuário
});

router.post("/cursos", async (req, res) => {
    try {
        const { nome, id, desc } = req.body;

        await db.none(
            "INSERT INTO cursos (idc, nome, descr) VALUES ($1, $2, $3);",
            [id, nome, desc]
        );

        res.sendStatus(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

router.post("/horarios2", async (req, res) => {
    try {
        const { hora } = req.body;

        await db.none(
            "INSERT INTO horarios (hora) VALUES ($1);",
            hora
        );

        res.sendStatus(200);
    } catch (error) {
        console.log(error);
        res.sendStatus(400);
    }
});

module.exports = router;
