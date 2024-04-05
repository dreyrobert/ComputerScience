$(document).ready(function() {
    // Captura o botão
    var changeThemeButton = $('#changeThemeButton');

    // Adiciona um ouvinte de evento de clique ao botão
    changeThemeButton.click(function() {
        // Captura o elemento body
        var body = $('body');

        // Verifica se o tema atual é claro ou escuro
        if (body.hasClass('dark-theme')) {
            // Se o tema for escuro, remove a classe dark-theme e adiciona a classe light-theme
            body.removeClass('dark-theme').addClass('light-theme');
        } else {
            // Se o tema for claro, remove a classe light-theme e adiciona a classe dark-theme
            body.removeClass('light-theme').addClass('dark-theme');
        }
    });
});

$(document).ready(function() {
    // Captura o elemento select
    var courseSelect = $('#courseSelect');
    
    // Captura o elemento div para as informações do curso
    var courseInfoDiv = $('#courseInfo');
    
    // Captura o elemento da tabela onde as informações do curso serão exibidas
    var courseScheduleTable = $('#courseSchedule');
    
    // Adiciona um ouvinte de evento de mudança ao elemento select
    courseSelect.change(function() {
        // Captura o valor selecionado
        var selectedCourse = courseSelect.val();
        
        // Atualiza dinamicamente as informações do curso
        if (selectedCourse === 'curso1') {
            courseInfoDiv.html(`
                <h1>Ciência da Computação</h1>
                <p>Turno: Integral</p>
                <p>Coordenação: Prof. Exemplo</p>
            `);
            courseScheduleTable.empty().append(`
                <tr><th>Curso</th><th>Horário</th></tr>
                <tr><td>Programação II</td><td>Segunda-feira, 8:00 - 12:00</td></tr>
                <tr><td rowspan="2">Compiladores</td><td>Quarta-feira, 8:00 - 12:00</td></tr>
            `);
        } else if (selectedCourse === 'curso2') {
            courseInfoDiv.html(`
                <h1>Engenharia de Software</h1>
                <p>Turno: Noturno</p>
                <p>Coordenação: Prof. Exemplo</p>
            `);
            courseScheduleTable.empty().append(`
                <tr><th>Curso</th><th>Horário</th></tr>
                <tr><td>Engenharia I</td><td>Terça-feira, 18:00 - 22:00</td></tr>
                <tr><td rowspan="2">Matemática C</td><td>Quinta-feira, 18:00 - 22:00</td></tr>
            `);
        }
    }).trigger('change'); // Dispara o evento de mudança inicialmente para garantir a visibilidade correta dos elementos
});

