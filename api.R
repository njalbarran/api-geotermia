library(plumber)

#* @get /multiplicar
#* @param x numeric
#* @param y numeric
function(x, y){
  x <- as.numeric(x)
  y <- as.numeric(y)
  list(resultado = x * y)
}

# Para correr localmente:
# pr <- plumber::plumb("api.R")
# pr$run(host="0.0.0.0", port=8000)
