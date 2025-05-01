-- Cambiar método de autenticación para el usuario root
/* ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '';
FLUSH PRIVILEGES; 
rm -rf /Applications/XAMPP/xamppfiles/var/mysql/db_products
DROP DATABASE db_products
*/

CREATE DATABASE IF NOT EXISTS db_products;

USE db_products;

-- CRECION DE TABLA users

CREATE TABLE users(
    id INT(11) NOT NULL,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(60) NOT NULL,
    fullname VARCHAR(100) NOT NULL
);

ALTER TABLE users
    ADD PRIMARY KEY (id);

ALTER TABLE users
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE users;

-- CREACION DE TABLA products

CREATE TABLE products ( 
    id INT(11) NOT NULL,
    product VARCHAR(150) NOT NULL,
    type VARCHAR(150) NOT NULL,
    description TEXT,
    stock INT(11) NOT NULL,
    price INT(11) NOT NULL,
    cost INT(11) NOT NULL,
    user_id INT(11),
    create_at timestamp NOT NULL DEFAULT current_timestamp,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE products
    ADD PRIMARY KEY (id);

ALTER TABLE products
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE products;

-- CRECION DE TABLA accounts

CREATE TABLE accounts (
    id INT(11) NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    type ENUM('ingreso', 'gasto') NOT NULL,
    category VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_platform ENUM('efectivo', 'visa', 'master', 'mercadopago') NOT NULL DEFAULT 'efectivo',
    installments INT DEFAULT 1,
    remaining_installments INT DEFAULT 1,
    fecha DATE NOT NULL,  -- Nueva columna para registrar la fecha manualmente
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_accounts_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

DESCRIBE accounts;

-- CRECION DE TABLA turns

CREATE TABLE turns (
    id INT(11) NOT NULL AUTO_INCREMENT,
    client_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    employee VARCHAR(100) NOT NULL,
    date DATETIME NOT NULL,
    user_id INT(11) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_turns_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

DESCRIBE turns;