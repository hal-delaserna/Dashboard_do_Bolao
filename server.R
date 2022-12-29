

server <- function(input, output, session) {
  
  output$id.Histograma <- 
    renderPlot({
    hist(df_Bolao$Valor, breaks = 30, col = 'darkgray', border = 'white',
         xlab = 'Aposta (R$)', ylab = "Nº de Servidores",
         main = 'Histograma das Apostas')
  })
  
  output$id.wordCloud <- 
    renderWordcloud2({
      wordcloud2(data = df_Bolao[c('Nome', 'Valor')], size = 0.2)
      })
  
  output$id.Tabela <- 
    renderReactable({
      reactable(df_Bolao 
                ,columns = list(
                 Valor = colDef(align = "center"
                                # ,aggregate = "count"
                                ))
                ,resizable = T
                ,filterable = T
                ,sortable = T
                ,pagination = T
                )
      })
  
    
  
  }




# Often we don't want the height of the bar to represent the
# count of observations, but the sum of some other variable.
# For example, the following plot shows the number of movies
# in each rating.
# m <- ggplot(movies, aes(rating))
# m + geom_histogram(binwidth = 0.1)