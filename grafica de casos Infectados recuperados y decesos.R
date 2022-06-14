library(dplyr)
library(ggplot2)
source("Themes ggplot2 dark background.R")
covid = read.csv("covid.csv", header = TRUE, sep = ",")

confirmados = filter(covid, clasificacion == 'CONFIRMADO')
fallecidos = filter(covid, evolucion == 'FALLECIO')

frame_confirmados = count(confirmados, num_ano)
frame_fallecidos = count(fallecidos, num_ano)

dia = 1:366
infectados = replicate(366, 0)
decesos = replicate(366, 0)
casos = data.frame(dia, infectados, decesos)

for (i in 1:nrow(frame_confirmados)) {
  casos[frame_confirmados[i,1],2] = frame_confirmados[i,2]
}
for (i in 1:nrow(frame_fallecidos)) {
  casos[frame_fallecidos[i,1],3] = frame_fallecidos[i,2]
}

montos =  ggplot(casos, aes(x=dia)) + 
    geom_point(aes(y = infectados), color = "#F74498") + 
    geom_line(aes(y = decesos), color="grey") + #recuperados color = #70dbdb
    scale_x_continuous(n.breaks = 28) +
    scale_y_continuous(n.breaks = 20) +
    theme_unique_dark()

montos

ggsave(filename = "imagenes/infectados_decesos.jpg", width = 1920, height = 1080, units = "px", device='jpg', dpi=100)

