import React, { useEffect, useState } from 'react';
import './App.css'; // Importe seu arquivo de estilo aqui
import { BrowserRouter as Router } from 'react-router-dom';
import Header from './components/Header';
import CourseSelector from './components/CourseSelector';
import CourseInfo from './components/CourseInfo';

const toggleTheme = () => {
  const currentTheme = document.body.classList.contains('dark-theme') ? 'dark-theme' : 'light-theme';
  const newTheme = currentTheme === 'dark-theme' ? 'light-theme' : 'dark-theme';

  document.body.classList.remove(currentTheme);
  document.body.classList.add(newTheme);
};

function App() {
  const [selectedCourse, setSelectedCourse] = useState('1');
  const [schedule, setSchedule] = useState([]);
  const [courseInfo, setCourseInfo] = useState({ nome: '', id: '', descr: '' });

  const handleCourseChange = (event) => {
    setSelectedCourse(event.target.value);
  };

  useEffect(() => {
    fetchCourseInfo(selectedCourse);
    fetchSchedule(selectedCourse); // Deve usar o courseId e não schedule
  }, [selectedCourse]);

  const fetchCourseInfo = (courseId) => {
    fetch(`http://localhost:3001/api/curso?id=${parseInt(courseId)}`)
      .then(response => response.json())
      .then(data => {
        if (data.length > 0 && !data[0].error) {
          setCourseInfo({
            nome: data[0].nome,
            id: data[0].idc,
            descr: data[0].descr
          });
        } else {
          console.error('Erro ao obter informações do curso:', data.error || 'Dados não encontrados');
        }
      })
      .catch(error => console.error('Erro na solicitação FETCH:', error));
  };

  const fetchSchedule = (courseId) => {
    fetch(`http://localhost:3001/api/horario?id=${parseInt(courseId)}`)
      .then(response => response.json())
      .then(data => {
        if (data.length > 0 && !data[0].error) {
          setSchedule(data.map(item => ({
            nome: item.nome,
            hora: item.hora
          })));
        } else {
          console.error('Erro ao obter informações do curso:', data.error || 'Dados não encontrados');
        }
      })
      .catch(error => console.error('Erro na solicitação FETCH:', error));
  };

  return (
    <Router>
      <div>
        <Header />
        <CourseSelector selectedCourse={selectedCourse} onChange={handleCourseChange} toggleTheme={toggleTheme} />
        <CourseInfo courseInfo={courseInfo} schedule={schedule} />
      </div>
    </Router>
  );
}

export default App;
