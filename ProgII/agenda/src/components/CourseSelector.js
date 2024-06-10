import React from 'react';
import '../App.css'; 

function CourseSelector({ selectedCourse, onChange, toggleTheme }) {
  return (
    <div className="container seletor-curso-container">
      <div className="alert alert-primary" role="alert">
        Um lembrete importante pode ser colocado aqui!
      </div>
      <div className="row row-cols-2">
        <div>
          <p>Escolha um curso abaixo:</p>
          <select id="courseSelect" style={{ margin: '0px' }} value={selectedCourse} onChange={onChange}>
            <option value="1">Ciência da Computação</option>
            <option value="2">Ciências Sociais</option>
            <option value="3">Medicina</option>
          </select>
        </div>
        <div className="second">
          <button id="changeThemeButton" className="btn btn-primary" onClick={toggleTheme}>Alterar Tema</button>
        </div>
      </div>
    </div>
  );
}

export default CourseSelector;
