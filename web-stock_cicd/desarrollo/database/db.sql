-- Cambiar método de autenticación para el usuario root
/* ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '';
FLUSH PRIVILEGES; */

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