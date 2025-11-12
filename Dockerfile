FROM rocker/r-ver:4.3.1

WORKDIR /app
COPY . /app

RUN R -e "install.packages(c('plumber','jsonlite'), repos='https://cran.rstudio.com/')"

EXPOSE 8000

CMD ["R", "-e", "pr <- plumber::plumb('api.R'); pr$run(host='0.0.0.0', port=as.integer(Sys.getenv('PORT',8000)))"]
