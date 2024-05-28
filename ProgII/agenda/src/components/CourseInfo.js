import React from 'react';
import './CourseInfo.css';

function CourseInfo({ courseInfo }) {
  return (
    <div className="container">
      <div className="row">
        <div className="col-md-6">
          <div className="course-info">
            <h1>{courseInfo.nome}</h1>
            <p>Turno: {courseInfo.turno}</p>
            <p>Coordenação: {courseInfo.id_campus}</p>
          </div>
        </div>
        <div className="col-md-6">
          <h5>Horários do Curso</h5>
          <table id="courseSchedule" className="table">
            <thead>
              <tr>
                <th>Curso</th>
                <th>Id</th>
              </tr>
            </thead>
            <tbody>
              {/* As linhas da tabela serão adicionadas dinamicamente aqui */}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default CourseInfo;
