function calcularDuracaoEvento(horaInicio, horaFim) {
    if (horaFim >= horaInicio) {
        return horaFim - horaInicio;
    } else {
        return (24 - horaInicio) + horaFim;
    }
}

const horaInicio = parseInt(prompt("Informe a hora de início do evento (0 a 23):"));
const horaFim = parseInt(prompt("Informe a hora de término do evento (0 a 23):"));

const duracaoEvento = calcularDuracaoEvento(horaInicio, horaFim);
console.log("Duração:" + duracaoEvento + " horas.");
