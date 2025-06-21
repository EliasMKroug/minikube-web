const express = require("express");
const router = express.Router();
const pool = require("../../database");
const { isLoggedIn } = require("../../lib/auth.js");

//  Obtener turnos y enviarlos a la vista
router.get("/", async (req, res) => {
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
        res.json({ events: events });

    } catch (error) {
        console.error("Error al obtener turnos:", error);
        res.status(500).send("Error interno");
    }
});

//  Guardar nuevo turno en la base de datos con validación
router.post("/add", async (req, res) => {
    try {
        const { client_name, email, phone, employee, fecha, hora, user_id } = req.body;
        const fechaHora = `${fecha} ${hora}:00`;

        // Verificar si el horario está ocupado
        const existingTurn = await pool.query(
            "SELECT * FROM turns WHERE employee = ? AND date = ?",
            [employee, fechaHora]
        );
        //console.log(existingTurn.length)
        if (existingTurn.length > 0) {
            req.json({ message: `No es posible realizar la reserva, el horario de ${employee} está ocupado` });
        }

        // Insertar en la base de datos
        const result = await pool.query(
            "INSERT INTO turns (client_name, email, phone, employee, date, user_id) VALUES (?, ?, ?, ?, ?, ?)",
            [client_name, email, phone, employee, fechaHora, user_id]
        );

        res.status(201).json({ message: "Turno creado con éxito" });

    } catch (error) {
        res.status(400).json({ message: "Error interno", error: error.message });
    }
});

module.exports = router;