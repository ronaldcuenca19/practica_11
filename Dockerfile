# Usa una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Instala dependencias del sistema y Python en un único paso para reducir capas
RUN apt-get update && \
    apt-get install -y python3-dev default-libmysqlclient-dev build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir --upgrade pip

# Copia los archivos necesarios
COPY requirements.txt /app

# Instala dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código fuente al contenedor
COPY . /app

# Expone el puerto 8000 para la aplicación Flask
EXPOSE 8000

# Comando por defecto para ejecutar la aplicación
CMD ["python", "app.py"]
