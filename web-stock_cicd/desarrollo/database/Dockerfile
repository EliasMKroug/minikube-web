# Usa la imagen oficial de MySQL
FROM mysql:5.7

# Copia el archivo SQL para crear la base de datos
COPY db.sql /docker-entrypoint-initdb.d/

# Establece las variables de entorno necesarias
ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"
ENV MYSQL_DATABASE="db_products"
