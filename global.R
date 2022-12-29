# library(gapminder)
library(ggplot2)
# library(plotly)
library(dplyr)
library(shiny)
library(reactable)
library(wordcloud2)

# df_Bolao <- 
#   read.table("./data/df_Bolao.csv", header = T, sep = ";",dec = ",",fileEncoding = "latin1")
# saveRDS(df_Bolao, file = "./data/df_Bolao.Rds")

df_Bolao <- 
  readRDS("./data/df_Bolao.Rds")
