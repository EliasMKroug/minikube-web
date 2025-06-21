const express = require("express");
const router = express.Router();
const pool = require("../database");
const { isLoggedIn } = require("../lib/auth");

// Obtener turnos y enviarlos a la vista
router.get("/", isLoggedIn, async (req, res) => {
  try {
    const rows = await pool.query("SELECT * FROM turns ORDER BY date ASC");
    const events = rows.map(turn => ({
      id: turn.id,
      title: `${turn.client_name} - ${turn.employee}`,
      start: new Date(turn.date).toISOString(),
      extendedProps: {
        nombre: turn.client_name,
        email: turn.email,
        phone: turn.phone
      }
    }));
    res.render("turns/turns", { events: JSON.stringify(events) });
  } catch (error) {
    console.error("Error al obtener turnos:", error);
    res.status(500).send("Error interno");
  }
});

// Formulario para agregar turnos
router.get("/add", isLoggedIn, (req, res) => {
  const horarios = [
    "09:00", "10:00", "11:00", "12:00",
    "13:00", "14:00", "15:00", "16:00",
    "17:00", "18:00"
  ];
  res.render("turns/add", { horarios });
});

// Guardar nuevo turno
router.post("/add", isLoggedIn, async (req, res) => {
  try {
    const { client_name, email, phone, employee, fecha, hora } = req.body;
    const user_id = req.user.id;
    const fechaHora = `${fecha} ${hora}:00`;

    const existingTurn = await pool.query(
      "SELECT * FROM turns WHERE employee = ? AND date = ?",
      [employee, fechaHora]
    );
    if (existingTurn.length > 0) {
      req.flash('message', `El horario de ${employee} está ocupado`);
      return res.redirect("/turns/add");
    }

    await pool.query(
      "INSERT INTO turns (client_name, email, phone, employee, date, user_id) VALUES (?, ?, ?, ?, ?, ?)",
      [client_name, email, phone, employee, fechaHora, user_id]
    );

    req.flash('success', 'Turno agregado con éxito');
    res.redirect("/turns");
  } catch (error) {
    console.error("Error al guardar el turno:", error);
    req.flash('message', 'Hubo un problema al guardar el turno.');
    res.redirect("/turns/add");
  }
});

// Eliminar turno desde FullCalendar
router.delete("/delete/:id", isLoggedIn, async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query("DELETE FROM turns WHERE id = ?", [id]);

    if (result.affectedRows > 0) {
      return res.status(200).json({ message: "Turno eliminado correctamente" });
    } else {
      return res.status(404).json({ message: "Turno no encontrado" });
    }
  } catch (error) {
    console.error("Error al eliminar turno:", error);
    res.status(500).json({ message: "Error interno al eliminar turno" });
  }
});

module.exports = router;
