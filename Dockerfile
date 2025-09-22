# Imagen base con Python
FROM python:3.10-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app

# Instala dependencias
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Expone el puerto 8000
EXPOSE 8000

# Ejecuta makemigrations, migrate y luego el servidor de desarrollo
CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
