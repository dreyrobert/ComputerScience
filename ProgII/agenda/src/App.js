import React, { useEffect, useState } from 'react';
import './App.css'; // Importe seu arquivo de estilo aqui
import { BrowserRouter as Router } from 'react-router-dom';
import Header from './components/Header';
import CourseSelector from './components/CourseSelector';
import CourseInfo from './components/CourseInfo';
import Accordions from './components/Accordions';

function App() {
  const [selectedCourse, setSelectedCourse] = useState('1100'); // Estado para armazenar o curso selecionado
  const [courseInfo, setCourseInfo] = useState({ nome: '', turno: '', id_campus: '' }); // Estado para armazenar as informações do curso

  // Função para carregar as informações do curso quando o curso selecionado mudar
  useEffect(() => {
    fetchCourseInfo(selectedCourse);
  }, [selectedCourse]);

  // Função para buscar as informações do curso a partir da API
  const fetchCourseInfo = (courseId) => {
    fetch(`http://localhost:3001/api/curso?id=${parseInt(courseId)}`)
      .then(response => response.json())
      .then(data => {
        if (!data.error) {
          setCourseInfo(data);
        } else {
          console.error('Erro ao obter informações do curso:', data.error);
        }
      })
      .catch(error => console.error('Erro na solicitação FETCH:', error));
  };

  // Função para alternar entre os temas
  const toggleTheme = () => {
    document.body.classList.toggle('dark-theme');
    document.body.classList.toggle('light-theme');
  };

  return (
    <Router>
      <div>
        <Header />
        <CourseSelector selectedCourse={selectedCourse} onChange={(e) => setSelectedCourse(e.target.value)} />
        <CourseInfo courseInfo={courseInfo} />
      </div>
    </Router>
  );
}

export default App;
