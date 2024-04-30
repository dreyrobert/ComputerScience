const database = {
  cursos: [
    {
      id: 1100,
      nome: "Ciência da Computação",
      turno: 0,
      id_campus: 1,
    },
    {
      id: 1101,
      nome: "Ciência da Computação",
      turno: 1,
      id_campus: 1,
    },
  ],
  ccrs: [
    {
      id: "GEX613",
      id_curso: 1101,
      nome: "Programação II",
    },
    {
      id: "GEX003",
      id_curso: 1101,
      nome: "Algoritmos e Programação",
    },
  ],
};
module.exports = database;