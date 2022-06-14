casos = data.frame(
  "paises" = c("VENEZUELA", "VENEZUELA", "PERU", "BOLIVIA", "PERU", "PERU", "CHILE", "ECUADOR", "BOLIVIA", "ECUADOR", "BRASIL", "VENEZUELA", "BRASIL", "BRASIL", "CHILE"), 
  "dia" = c(1,5,5,5,2,4,3,7,7,6,1,6,4,3,3), 
  "casos" = c("SI","SI","SI","SI","SI","SI","SI","SI","SI","SI","SI","SI","SI","SI","SI")
)
casos = arrange(casos, dia)
casos_por_dia = data.frame(matrix(0, ncol = nlevels(factor(casos$dia))-1, nrow = nlevels(factor(casos$paises))+1))
colnames(casos_por_dia) = levels(factor(casos$paises))

for (caso in 1:nrow(casos)) {
  casos_por_dia[casos[caso, 2], casos[caso, 1]] = casos_por_dia[casos[caso, 2], casos[caso, 1]] + 1
}

