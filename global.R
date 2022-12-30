library(dplyr)
library(ggplot2)
library(shiny)
library(shinydashboard)
library(reactable)
library(wordcloud)

# df_Bolao <- 
#   read.table("./data/df_Bolao.csv", header = T, sep = ";",dec = ",",fileEncoding = "latin1")
# 
# 
# df_Bolao$Nome <- 
#   gsub(df_Bolao$Nome, pattern = " [A-Z]{2}", replacement = " **")
# 
# df_Bolao$fracao <-
#   100*df_Bolao$Valor/(sum(df_Bolao$Valor))
# 
# df_Bolao$fatia <- 
#   round(10000*df_Bolao$Valor/(sum(df_Bolao$Valor)),0)
# 
# saveRDS(df_Bolao, file = "./data/df_Bolao.Rds")


df_Bolao <- 
  readRDS("./data/df_Bolao.Rds")


getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
