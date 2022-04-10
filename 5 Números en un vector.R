# Programa que lee a y b y los busca dentro de un Vector y muestra si a y b existen en el

numeros = c()
tam = as.integer(readline(prompt = "Ingrese tamaño del arreglo: "))

for (i in 1:tam){
  temp = as.integer(readline(prompt = "Ingrese numero: "))
  numeros = c(numeros, temp)
}

a = as.integer(readline(prompt = "Ingrese a: "))
b = as.integer(readline(prompt = "Ingrese b: "))

estado_a = FALSE
estado_b = FALSE

for (i in 1:tam) {
  if(numeros[i] == a){
    estado_a = TRUE
  } else if(numeros[i] == b){
    estado_b = TRUE
  }
}
if(estado_a == TRUE & estado_b == FALSE ){
  cat("El numero a está en la lista")
} else if(estado_b == TRUE & estado_a == FALSE){
  cat("El numero b está en la lista")
} else if(estado_b == TRUE & estado_a == TRUE){
  cat("a y b están en la lista")
} else if(estado_b == FALSE & estado_a == FALSE){
  cat("los números no están en la lista")
}

