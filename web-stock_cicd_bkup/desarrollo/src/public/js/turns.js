document.addEventListener("DOMContentLoaded", function () {
    let calendarEl = document.getElementById("calendar");

    if (!calendarEl) {
        console.error("Error: No se encontró el contenedor del calendario.");
        return;
    }

    let calendar = new FullCalendar.Calendar(calendarEl, {
        themeSystem: 'bootstrap5',
        initialView: 'timeGridWeek',
        weekNumbers: true,
        titleFormat: {
            year: 'numeric', 
            month: 'long',
            day: 'numeric'
        },
        slotMinTime: "08:00:00",
        slotMaxTime: "20:00:00",
        allDaySlot: false,
        hiddenDays: [0],
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'timeGridWeek,timeGridDay,listWeek'
        },
        slotDuration: "01:00:00",
        selectable: true, // ✅ Esto habilita que puedas hacer click en las celdas
        events: events,
        eventContent: function (info) {
            let event = info.event;
            let title = event.title;
            let phone = event.extendedProps.phone;
            let email = event.extendedProps.email;

            let content = `
                <b>${title}</b><br>
                <b> Tel: ${phone}</b><br>
                <b> Email: ${email}</b><br>
            `;
            return { html: content };
        },
        // ✅ Esta función permite redirigir al hacer clic en una celda vacía
        dateClick: function (info) {
            console.log("Click en: ", info.dateStr); // Debug opcional
            window.location.href = "/turns/add"; // Redirección manual
        }
    });

    calendar.render();
});