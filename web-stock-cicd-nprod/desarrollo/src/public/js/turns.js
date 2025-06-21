document.addEventListener("DOMContentLoaded", function() {
    const calendarEl = document.getElementById("calendar");
    if (!calendarEl) {
      console.error("Error: No se encontró el contenedor del calendario.");
      return;
    }
  
    const calendar = new FullCalendar.Calendar(calendarEl, {
      themeSystem: 'bootstrap5',
      initialView: 'timeGridWeek',
      weekNumbers: true,
      titleFormat: { year: 'numeric', month: 'long', day: 'numeric' },
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
      selectable: true,
      events: events,
      eventContent: info => {
        const e = info.event.extendedProps;
        const html = `
          <b>${info.event.title}</b><br>
          <b>Tel:</b> ${e.phone}<br>
          <b>Email:</b> ${e.email}<br>
        `;
        return { html };
      },
      dateClick: info => {
        window.location.href = "/turns/add";
      },
      eventClick: info => {
        if (!confirm(`¿Eliminar turno "${info.event.title}"?`)) return;
      
        fetch(`/turns/delete/${info.event.id}`, { method: 'DELETE' })
          .then(response =>
            response.json().then(data => ({ ok: response.ok, data }))
          )
          .then(({ ok, data }) => {
            alert(data.message);
            if (ok) calendar.refetchEvents();
          })
          .catch(err => {
            console.error(err);
            alert('Error al eliminar turno');
          });
      }
      
    });
  
    calendar.render();
  });
  