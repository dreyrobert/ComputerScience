import React from 'react';
import Accordion from 'react-bootstrap/Accordion';
import Card from 'react-bootstrap/Card';
import './Accordions.css';

function Accordions() {
  return (
    <div className="acordeao-back">
      <div className="container acordeao">
        <Accordion defaultActiveKey="0">
          <Card>
            <Accordion.Toggle as={Card.Header} eventKey="0">
              Saiba mais sobre o Estudante
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="0">
              <Card.Body>Robert Biasoli Drey, matricula 2211100013.</Card.Body>
            </Accordion.Collapse>
          </Card>
          <Card>
            <Accordion.Toggle as={Card.Header} eventKey="1">
              Sobre a Disciplina
            </Accordion.Toggle>
            <Accordion.Collapse eventKey="1">
              <Card.Body>A disciplina de Programação II na Universidade Federal da Fronteira Sul aborda o desenvolvimento avançado de aplicações web. Os alunos aprendem linguagens como HTML, CSS, JavaScript, além de frameworks populares como React.js. O curso foca em conceitos fundamentais de programação web e práticas de desenvolvimento, capacitando os estudantes para criar aplicações completas, do frontend ao backend, utilizando tecnologias modernas como Node.js. O objetivo é preparar os alunos para atuar como desenvolvedores web qualificados e atualizados.</Card.Body>
            </Accordion.Collapse>
          </Card>
        </Accordion>
      </div>
    </div>
  );
}

export default Accordions;
