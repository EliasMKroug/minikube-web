# Etapa 1: build de la app
FROM node:18-alpine as build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa 2: imagen final con NGINX
FROM nginx:stable-alpine

# Copia el build a la carpeta pública de NGINX
COPY --from=build /app/build /usr/share/nginx/html

# Opcional: configuración personalizada de NGINX (si querés manejar rutas con React Router)
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
