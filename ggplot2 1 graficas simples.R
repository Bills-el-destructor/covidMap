# Movimiento browniano
set.seed(2)

# Grid
t <- seq(0, 1, by = 0.001)
p <- length(t) - 1

# 5 trayectorias
n <- 5
I <- matrix(rnorm(n * p, 0, 1 / sqrt(p)), n, p)

# Data frame
df1 <- data.frame(apply(I, 1, cumsum))

# install.packages("reshape")
library(reshape)

df <- data.frame(x = seq_along(df1[, 1]),
                 df1)

# Formato long
df <- melt(df, id.vars = "x")

library(ggplot2)

# Seleccion de colores
cols <- c("#D43F3A", "#EEA236", "#5CB85C", "#46B8DA", "#9632B8")

ggplot(df, aes(x = x, y = value, color = variable)) +
  geom_line() +
  scale_color_manual(values = cols)