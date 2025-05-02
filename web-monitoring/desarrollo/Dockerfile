# Usa una imagen base de Node.js
FROM node:18-alpine AS builder

# Establece el directorio de trabajo
WORKDIR /usr/src/index.js

# Copia los archivos package.json y package-lock.json
COPY . .

# Instala las dependencias
RUN npm install

# Expone el puerto en el que corre tu app
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]