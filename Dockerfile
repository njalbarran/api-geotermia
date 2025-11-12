# Imagen base de R estable
FROM rocker/r-ver:4.3.1

# Instala dependencias del sistema necesarias para plumber y jsonlite
RUN apt-get update && apt-get install -y \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  && rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /app

# Copia todos los archivos de la API
COPY . /app

# Instala los paquetes R necesarios
RUN R -e "install.packages(c('plumber', 'jsonlite'), repos='https://cloud.r-project.org/')"

# Expone el puerto
EXPOSE 8000

# Comando para iniciar la API
CMD ["R", "-e", "pr <- plumber::plumb('api.R'); pr$run(host='0.0.0.0', port=as.integer(Sys.getenv('PORT',8000)))"]
