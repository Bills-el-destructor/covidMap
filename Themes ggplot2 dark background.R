# 1 Theme
theme_unique_light <- function (base_size = 12, base_family = "") {
  ret <- (theme_bw(base_size = base_size, base_family = base_family) +
            theme(text = element_text(colour = "black"),
                  title = element_text(color = "black"),
                  line = element_line(color = "black"),
                  rect = element_rect(fill = "white", color = "black"),
                  axis.ticks = element_line(color = "black"),
                  axis.line = element_line(color = "black", linetype = 1),
                  legend.background = element_rect(fill = NULL, color = NULL),
                  legend.position = "bottom",
                  legend.key = element_rect(fill = NA, color = NA, linetype = 0),
                  strip.background = element_rect(fill=NA,colour=NA,size=NA,linetype = NULL),
                  strip.text = element_text(color="black",face="bold",vjust=.5,hjust=.5),
                  panel.background = element_rect(fill = NULL, color = NULL),
                  panel.border = element_blank(),
                  panel.grid = element_line(color = "#f0f0f0"),
                  panel.grid.major = element_line(color = "#f0f0f0"),
                  panel.grid.minor = element_line(color = "#fAfAfA"),
                  plot.background = element_rect(fill = NULL, colour = NA, linetype = 0)))
  ret
}

# 2 Theme
theme_unique_dark <- function (base_size = 12, base_family = "") {
  ret <- (theme_bw(base_size = base_size, base_family = base_family) +
            theme(text = element_text(colour = "white"),
                  title = element_text(color = "white"),
                  line = element_line(color = "white"),
                  rect = element_rect(fill = "black", color = "white"),
                  axis.ticks = element_line(color = "#969696"),
                  axis.title = element_text(color = "white"),
                  axis.text = element_text(color = "#eaeaea"),
                  axis.line = element_line(color = "#969696", linetype = 1),
                  legend.background = element_rect(fill = NULL, color = NULL),
                  legend.position = "bottom",
                  legend.key = element_rect(fill = NA, color = NA, linetype = 0),
                  strip.background = element_rect(fill=NA,colour=NA,size=NA,linetype = NULL),
                  strip.text = element_text(color="white",face="bold",vjust=.5,hjust=.5),
                  panel.background = element_rect(fill = "black", color = NULL),
                  panel.border = element_blank(),
                  panel.grid = element_line(color = "#252525"),
                  panel.grid.major = element_line(color = "#1b1b1b"),
                  panel.grid.minor = element_line(color = "#101010"),
                  plot.background = element_rect(fill = "black", colour = "black", linetype = 0)))
  ret
}

#custom colour scales
scale_color_unique <- function(palette="light_intense",...){
  discrete_scale(c("colour","fill"), "unique", unique_color_pal(palette),...) }

scale_fill_unique <- function(palette="light_intense",...){
  discrete_scale(c("fill"), "unique", unique_color_pal(palette),...) }

unique_color_pal <- function (palette = "light_intense"){
  if (!palette %in% c("light_intense","light_medium","light_pale","dark_intense","dark_medium","dark_pale")) {
    stop(sprintf("%s is not a valid palette name", palette)) }
  if (palette == "light_intense") {
    types <- c("#ff0066","#29a3a3","#33cc33","#ff5500","#cc00cc","#3333ff","#ffff33","#000000") }
  else if (palette == "light_medium") {
    types <- c("#ff4d94","#70dbdb","#70db70","#ff884d","#ff4dff","#6666ff","#ffff70","#808080") }
  else if (palette == "light_pale") {
    types <- c("#ff8098","#99e6e6","#adebad","#ffaa80","#ff99ff","#b3b3ff","#ffffb3","#cccccc") }
  else if (palette == "dark_intense") {
    types <- c("#ff0066","#29a3a3","#33cc33","#ff5500","#cc00cc","#3333ff","#ffff33","#ffffff") }
  else if (palette == "dark_medium") {
    types <- c("#ff4d94","#70dbdb","#70db70","#ff884d","#ff4dff","#6666ff","#ffff70","#999999") }
  else if (palette == "dark_pale") {
    types <- c("#ff8098","#99e6e6","#adebad","#ffaa80","#ff99ff","#b3b3ff","#ffffb3","#bfbfbf") }
  function(n) { unname(types)[seq_len(n)] }
}