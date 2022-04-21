distrito = c("Cabana", "Cabanillas", "Caracoto", "Juliaca", "San Miguel")
id_distrito = c(1,2,3,4,5)
polygono = c("Poligono1", "Poligono2", "Poligono3", "Poligono4", "Poligono5")



casos_Cabana = c(1,2,3,4,5,6,7)
casos_Cabanillas = c(1,3,6,9,12,15,18)
casos_Caracoto = c(1,4,8,12,16,20,24)
casos_Juliaca = c(1,2,3,5,8,13,21)
casos_San_Miguel = c(1,3,5,7,9,11,13)

casos_San_Roman = rbind(casos_Cabana, casos_Cabanillas, casos_Caracoto, casos_Juliaca, casos_San_Miguel)

covid = data.frame(id_distrito, distrito, polygono, casos_San_Roman)


modelo = lm(dist ~ speed, data = cars)
