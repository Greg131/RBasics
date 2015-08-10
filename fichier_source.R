myfunction <- function(x) {
  y <- rnorm(100)
  mean(y)
}

second  <-  function(x) {
  x+rnorm(length(x))
}

print("imprime en sourcant le fichier")
