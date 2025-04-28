# Usa una imagen oficial de Python
FROM python:3.11-slim

# Crea carpeta de trabajo
WORKDIR /app

# Copia requirements e instala
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo el código
COPY src/ .

# Expone el puerto que usa Flask
EXPOSE 5000

# Variables de entorno para Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Comando para arrancar
CMD ["flask", "run"]
