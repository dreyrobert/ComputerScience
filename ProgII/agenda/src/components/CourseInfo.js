import React from 'react';
import './CourseInfo.css';

function CourseInfo({ courseInfo, schedule }) {
  return (
    <div className="container">
      <div className="row">
        <div className="col-md-6">
          <div className="course-info">
            <h1>{courseInfo.nome}</h1>
            <p>Id: {courseInfo.id}</p>
            <p>Descrição: {courseInfo.descr}</p>
          </div>
        </div>
        <div className="col-md-6">
          <h5>Horários do Curso</h5>
          <table id="courseSchedule" className="table">
            <thead>
              <tr>
                <th>Disciplina</th>
                <th>Hora</th>
              </tr>
            </thead>
            <tbody>
              {Array.isArray(schedule) && schedule.length > 0 ? (
                schedule.map((element, index) => (
                  <tr key={index}>
                    <td>{element.nome}</td>
                    <td>{element.hora}</td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="2">Nenhum horário disponível</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default CourseInfo;
