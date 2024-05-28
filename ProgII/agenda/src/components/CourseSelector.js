import React from 'react';
import './CourseSelector.css';

function CourseSelector({ selectedCourse, onChange }) {
  return (
    <div className="container seletor-curso-container">
      <div className="alert alert-primary" role="alert">
        Um lembrete importante pode ser colocado aqui!
      </div>
      <div className="row row-cols-2">
        <div>
          <p>Escolha um curso abaixo:</p>
          <select id="courseSelect" style={{ margin: '0px' }} value={selectedCourse} onChange={onChange}>
            <option value="1100">Ciência da Computação</option>
            <option value="1101">Engenharia de Software</option>
          </select>
        </div>
        <div className="second">
          <button id="changeThemeButton" className="btn btn-primary">Alterar Tema</button>
        </div>
      </div>
    </div>
  );
}

export default CourseSelector;
