$(document).ready(function() {
    // Controlador para mudança de tema
    var themeController = {
        changeThemeButton: $('#changeThemeButton'),
        body: $('body'),

        init: function() {
            this.changeThemeButton.on('click', this.toggleTheme.bind(this));
        },

        toggleTheme: function() {
            if (this.body.hasClass('dark-theme')) {
                this.body.removeClass('dark-theme').addClass('light-theme');
            } else {
                this.body.removeClass('light-theme').addClass('dark-theme');
            }
        }
    };

    // Controlador para informações do curso
    var courseController = {
        courseSelect: $('#courseSelect'),
        courseInfoDiv: $('#courseInfo'),
        courseScheduleTable: $('#courseSchedule'),

        init: function() {
            this.courseSelect.on('change', this.updateCourseInfo.bind(this));
            this.updateCourseInfo(); // Chama a função para garantir que as informações estejam corretas na inicialização
        },

        updateCourseInfo: function() {
            var selectedCourse = this.courseSelect.val();
            if (selectedCourse === 'curso1') {
                this.showCourseInfo('Ciência da Computação', 'Integral', 'Prof. Exemplo', [
                    { course: 'Programação II', time: 'Segunda-feira, 8:00 - 12:00' },
                    { course: 'Compiladores', time: 'Quarta-feira, 8:00 - 12:00' }
                ]);
            } else if (selectedCourse === 'curso2') {
                this.showCourseInfo('Engenharia de Software', 'Noturno', 'Prof. Exemplo', [
                    { course: 'Engenharia I', time: 'Terça-feira, 18:00 - 22:00' },
                    { course: 'Matemática C', time: 'Quinta-feira, 18:00 - 22:00' }
                ]);
            }
        },

        showCourseInfo: function(title, shift, coordinator, schedule) {
            this.courseInfoDiv.html(`
                <h1>${title}</h1>
                <p>Turno: ${shift}</p>
                <p>Coordenação: ${coordinator}</p>
            `);

            var scheduleHtml = `<tr><th>Curso</th><th>Horário</th></tr>`;
            schedule.forEach(function(course) {
                scheduleHtml += `<tr><td>${course.course}</td><td>${course.time}</td></tr>`;
            });

            this.courseScheduleTable.html(scheduleHtml);
        }
    };

    // Inicialização dos controladores
    themeController.init();
    courseController.init();
});
