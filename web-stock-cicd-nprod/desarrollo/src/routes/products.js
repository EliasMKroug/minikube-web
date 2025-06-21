/* CONTIENE TODOS LOS LINKS QUE GUARDO EN MI DB */
const express = require('express')
const router = express.Router()

const pool = require('../database')
const { isLoggedIn } = require('../lib/auth')

/* ENDPOINT PARA REFRESCAR USUARIO ACTUAL */
router.get('/', isLoggedIn, async (req, res) => {
    try {
        const products = await pool.query('SELECT * FROM products WHERE user_id = ?', [req.user.id]);

        // Calcular los totales
        const totalStock = products.reduce((sum, product) => sum + product.stock, 0);
        const totalPrice = products.reduce((sum, product) => sum + product.price, 0);
        const totalCost = products.reduce((sum, product) => sum + product.cost, 0);

        res.render('products/list', {
            products,
            totalStock,
            totalPrice,
            totalCost
        });
    } catch (err) {
        console.error('Error al obtener productos:', err);
        res.status(500).send('Server Error');
    }
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
        req.flash('message', 'No se pudo borrar el producto.');
    }
    res.redirect('/products');
});

/* RUTA PARA CARGAR EL FORMULARIO DE EDICIÓN */
router.get('/edit/:id', isLoggedIn, async (req, res) => {
    try {
        const { id } = req.params;
        const products = await pool.query('SELECT * FROM products WHERE id = ?', [id]);

        if (products.length === 0) {
            req.flash('error', 'Producto no encontrado');
            return res.redirect('/products');
        }

        res.render('products/edit', { products: products[0] }); // Enviar el producto encontrado
    } catch (error) {
        console.error('Error al obtener producto:', error);
        req.flash('message', 'Hubo un problema al cargar la edición del producto.');
        res.redirect('/products');
    }
});

/* ENDPOINT PARA ACTUALIZAR PRODUCTO */
router.post('/edit/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    const { product, type, description, stock, price, cost } = req.body;

    const updatedProduct = {
        product,
        type,
        description,
        stock,
        price,
        cost,
    };

    try {
        await pool.query('UPDATE products SET ? WHERE id = ?', [updatedProduct, id]);
        req.flash('success', 'Producto actualizado con éxito');
        res.redirect('/products');
    } catch (error) {
        console.error('Error al actualizar producto:', error);
        req.flash('message', 'No se pudo actualizar el producto.');
        res.redirect(`/products/edit/${id}`);
    }
});

module.exports = router
