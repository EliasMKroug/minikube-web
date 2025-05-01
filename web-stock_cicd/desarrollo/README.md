para iniciar el programa debe ejecutar el siguiente comando: 

- npm run dev



DESPLIEGUE DE DOCKER

# Construir la imagen de la aplicación Node.js
docker build -t web-stack-nodejs .

# Construir la environment de minikube
eval $(minikube docker-env)

# Construir la imagen de MySQL (si tienes un Dockerfile)
docker build -t web-stack-mysql .





# Usa la imagen oficial de MySQL
FROM mysql:5.7

# Copia el archivo SQL para crear la base de datos
COPY database/db.sql /docker-entrypoint-initdb.d/

# Establece las variables de entorno necesarias
ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"
ENV MYSQL_DATABASE="db_products"




# Usa una imagen base de Node.js
FROM node:18

# Establece el directorio de trabajo
WORKDIR /usr/src/index

# Copia los archivos package.json y package-lock.json
COPY . .

# Instala las dependencias
RUN npm install

# Expone el puerto en el que corre tu app
EXPOSE 4000

# Comando para iniciar la aplicación
CMD ["npm", "start"]





