document.addEventListener('DOMContentLoaded', function() {
    // Captura o botão
    var changeThemeButton = document.getElementById('changeThemeButton');

    // Adiciona um ouvinte de evento de clique ao botão
    changeThemeButton.addEventListener('click', function() {
        // Captura o elemento body
        var body = document.body;

        // Verifica se o tema atual é claro ou escuro
        if (body.classList.contains('dark-theme')) {
            // Se o tema for escuro, remove a classe dark-theme e adiciona a classe light-theme
            body.classList.remove('dark-theme');
            body.classList.add('light-theme');
        } else {
            // Se o tema for claro, remove a classe light-theme e adiciona a classe dark-theme
            body.classList.remove('light-theme');
            body.classList.add('dark-theme');
        }
    });
});

document.addEventListener('DOMContentLoaded', function() {
    // Captura o elemento select
    var courseSelect = document.getElementById('courseSelect');
    
    // Captura o elemento div para as informações do curso
    var courseInfoDiv = document.getElementById('courseInfo');
    
    // Adiciona um ouvinte de evento de mudança ao elemento select
    courseSelect.addEventListener('change', function() {
        // Captura o valor selecionado
        var selectedCourse = courseSelect.value;
        
        // Atualiza dinamicamente as informações do curso
        if (selectedCourse === 'curso1') {
            courseInfoDiv.innerHTML = `
                <h1>Curso de Exemplo 1</h1>
                <p>Turno: Integral</p>
                <p>Coordenação: Prof. Exemplo</p>
            `;
        } else if (selectedCourse === 'curso2') {
            courseInfoDiv.innerHTML = `
                <h1>Curso de Exemplo 2</h1>
                <p>Turno: Noturno</p>
                <p>Coordenação: Prof. Exemplo</p>
            `;
        }
        
        // Captura o elemento da tabela onde as informações do curso serão exibidas
        var courseScheduleTable = document.getElementById('courseSchedule');
        
        // Limpa o conteúdo atual da tabela
        courseScheduleTable.innerHTML = '';
        
        // Adiciona o cabeçalho da tabela
        courseScheduleTable.innerHTML += '<tr><th>Curso</th><th>Horário</th></tr>';
        
        // Adiciona as informações do curso selecionado à tabela
        if (selectedCourse === 'curso1') {
            courseScheduleTable.innerHTML += '<tr><td>Curso de Exemplo 1</td><td>Segunda-feira, 8:00 - 12:00</td></tr>';
            courseScheduleTable.innerHTML += '<tr><td rowspan="2">Curso de Exemplo 1</td><td>Quarta-feira, 8:00 - 12:00</td></tr>';
        } else if (selectedCourse === 'curso2') {
            courseScheduleTable.innerHTML += '<tr><td>Curso de Exemplo 2</td><td>Terça-feira, 18:00 - 22:00</td></tr>';
            courseScheduleTable.innerHTML += '<tr><td rowspan="2">Curso de Exemplo 2</td><td>Quinta-feira, 18:00 - 22:00</td></tr>';
        }
    });
});


