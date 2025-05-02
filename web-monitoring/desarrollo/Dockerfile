# Usa una imagen base de Node.js
FROM node:18

# Establece el directorio de trabajo
WORKDIR /usr/src/index

# Copia los archivos package.json y package-lock.json
COPY . .

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos de la aplicación
COPY . .
# Instala las dependencias de producción
RUN npm run build

# Expone el puerto en el que corre tu app
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]