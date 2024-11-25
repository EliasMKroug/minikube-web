/* CONTIENE TODOS LOS LINKS QUE GUARDO EN MI DB */
const express = require('express')
const router = express.Router()

const pool = require('../database')
const { isLoggedIn } = require('../lib/auth')

/* ENDPOINT PARA REFRESCAR USUARIO ACTUAL */
router.get('/', isLoggedIn, async (req, res) => {
    const products = await pool.query('SELECT * FROM products WHERE user_id = ?', [req.user.id]);
    res.render('products/list', { products }); // Asegúrate de tener la vista correspondiente.
});

/* ENDOPOINT PARA PODER RENDERIZAR LA LISTA DE PRODUCTOS*/
router.get('/add', isLoggedIn, (req, res) => {
    res.render('products/add'); // Asegúrate de que 'products/add' existe y es el archivo HBS correcto.
});

/* ENDOPOINT PARA AGREGAR PRODUCTO */
router.post('/add', isLoggedIn, async (req, res) => {
    const { product, type, description, stock, price, cost } = req.body;
    let user_id = req.user.id;

    const newProduct = {
        product,
        type,
        description,
        stock,
        price,
        cost,
        user_id,
    };

    try {
        await pool.query('INSERT INTO products SET ?', [newProduct]);
        req.flash('success', 'Producto agregado con éxito');
        res.redirect('/products');
    } catch (error) {
        console.error('Error al insertar producto:', error);
        req.flash('error', 'No se pudo agregar el producto.');
        res.redirect('/products/add');
    }
});

/* ENDOPOINT PARA BORRAR Y REDIRECCIONAR EN LA DB */
router.get('/delete/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    try {
        await pool.query('DELETE FROM products WHERE id = ?', [id]);  // Cambié 'links' por 'products'
        req.flash('success', 'Producto borrado con éxito');
    } catch (error) {
        console.error('Error al borrar producto:', error);
        req.flash('error', 'No se pudo borrar el producto.');
    }
    res.redirect('/products');
});



module.exports = router


/* ENDPOUINT PARA MOSTRAR LINKS POR USUARIO*/
/* router.get('/', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM links WHERE user_id = ?', [req.user.id])
    console.log(links)
    res.render('links/list', { links })
}) */



/* RUTA DE EDICION DE LINKS */
/* router.get('/edit/:id', isLoggedIn,async (req, res) => {
    const { id } = req.params
    const links = await pool.query('SELECT * FROM links WHERE id = ?', [id])
    res.render('links/edit', {link: links[0]} )
}) */

/* RUTA PARA EDITAR LINKS */
/* router.post('/edit/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params
    const { title, url, description } = req.body
    const newLink = {
        title,
        url,
        description
    }
    await pool.query('UPDATE links set ? WHERE id = ?', [newLink, id])
    req.flash('success', 'Link actualizado con exito')
    res.redirect('/links')
}) */
