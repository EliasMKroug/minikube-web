    const express = require('express');
    const router = express.Router();
    const pool = require('../database');
    const { isLoggedIn } = require('../lib/auth');

    router.get('/', isLoggedIn, async (req, res) => {
        try {
            const { type, category, payment_platform, fecha, order = 'desc' } = req.query;
            let query = 'SELECT * FROM accounts WHERE user_id = ?';
            const params = [req.user.id];

            if (type) {
                query += ' AND type = ?';
                params.push(type);
            }
            if (category) {
                query += ' AND category LIKE ?';
                params.push(`%${category}%`);
            }
            if (payment_platform) {
                query += ' AND payment_platform LIKE ?';
                params.push(`%${payment_platform}%`);
            }
            if (fecha) {
                const [year, month] = fecha.split('-');
                query += ' AND YEAR(fecha) = ? AND MONTH(fecha) = ?';
                params.push(year, month);
            }

            query += ` ORDER BY fecha ${order.toUpperCase()}`;

            const accounts = await pool.query(query, params);

            // Calcular el total del gasto
            const totalGasto = accounts.reduce((total, account) => {
                return account.type === 'gasto' ? total + parseFloat(account.amount) : total;
            }, 0);

            res.render('accounts/list', { accounts, totalGasto });
        } catch (error) {
            console.error('Error al obtener las transacciones:', error);
            req.flash('error', 'No se pudieron cargar las transacciones.');
            res.redirect('/');
        }
    });

    // Formulario para agregar una nueva transacción
    router.get('/add', isLoggedIn, (req, res) => {
        res.render('accounts/add');
    });

    // Ruta para agregar una nueva transacción
    router.post('/add', isLoggedIn, async (req, res) => {
        const { type, category, amount, payment_platform, installments, fecha, description } = req.body;
        const user_id = req.user.id;

        const newTransaction = {
            type,
            category,
            amount,
            payment_platform,
            installments,
            remaining_installments: installments, // Guardar el valor de cuotas ingresado por el usuario
            fecha,        
            description,
            user_id
        };

        try {
            await pool.query('INSERT INTO accounts SET ?', [newTransaction]);
            req.flash('success', 'Transacción registrada con éxito');
            res.redirect('/accounts');
        } catch (error) {
            console.error('Error al insertar transacción:', error);
            req.flash('error', 'No se pudo agregar la transacción.');
            res.redirect('/accounts/add');
        }
    });

    router.get('/delete/:id', isLoggedIn, async (req, res) => {
        const { id } = req.params;
        try {
            await pool.query('DELETE FROM accounts WHERE id = ? AND user_id = ?', [id, req.user.id]);
            req.flash('success', 'Transacción eliminada correctamente');
        } catch (error) {
            console.error('Error al eliminar transacción:', error);
            req.flash('message', 'No se pudo eliminar la transacción.');
        }
        res.redirect('/accounts');
    });


    router.get('/edit/:id', isLoggedIn, async (req, res) => {
        try {
            const { id } = req.params;
            const accounts = await pool.query('SELECT * FROM accounts WHERE id = ? AND user_id = ?', [id, req.user.id]);
            if (accounts.length > 0) {
                res.render('accounts/edit', { accounts: accounts[0] });
            } else {
                req.flash('message', 'Transacción no encontrada');
                res.redirect('/accounts');
            }
        } catch (error) {
            console.error('Error al obtener la transacción:', error);
            req.flash('message', 'No se pudo cargar la transacción.');
            res.redirect('/accounts');
        }
    });


    router.post('/edit/:id', isLoggedIn, async (req, res) => {
        const { id } = req.params;
        const { type, category, amount, payment_platform, installments, fecha, description } = req.body;

        const updatedTransaction = {
            type,
            category,
            amount,
            payment_platform,
            installments,
            fecha,
            description,
        };

        try {
            await pool.query('UPDATE accounts SET ? WHERE id = ? AND user_id = ?', [updatedTransaction, id, req.user.id]);
            req.flash('success', 'Transacción actualizada correctamente');
            res.redirect('/accounts');
        } catch (error) {
            console.error('Error al actualizar transacción:', error);
            req.flash('message', 'No se pudo actualizar la transacción.');
            res.redirect('/accounts/edit/' + id);
        }
    });

    // Ruta para el dashboard
    router.get('/dashboard', isLoggedIn, async (req, res) => {
        try {
            const accounts = await pool.query('SELECT * FROM accounts WHERE user_id = ?', [req.user.id]);
            res.render('accounts/dashboard', { accounts });
        } catch (error) {
            console.error('Error al obtener las transacciones:', error);
            req.flash('error', 'No se pudieron cargar las transacciones.');
            res.redirect('/');
        }
    });

    // Ruta tarjeta de credito
    router.get('/card', isLoggedIn, async (req, res) => {
        try {
            const accounts = await pool.query('SELECT * FROM accounts WHERE user_id = ?', [req.user.id]);
            const startDate = '2025-01-31'; // Fecha de inicio específica
            const endDate = '2025-02-27'; // Fecha de fin específica
            res.render('accounts/card', { accounts: JSON.stringify(accounts), startDate, endDate });
        } catch (error) {
            console.error('Error al obtener las transacciones:', error);
            req.flash('error', 'No se pudieron cargar las transacciones.');
            res.redirect('/');
        }
    });

    module.exports = router;