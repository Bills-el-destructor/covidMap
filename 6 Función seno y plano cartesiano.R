# Programa que grarica la funcion seno

x = 0:1079
y = c()
for (i in 1:length(x)) {
  seno = sin(x[i]*pi/180)
  y = c(y, seno)
}

plot(x,y)

# Codigo para dibujar las coordenadas x y 
abline(v=0, h=0)