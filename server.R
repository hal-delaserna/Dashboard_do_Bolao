# library(ggpubr)
# library(jpeg)
# img <- readJPEG("./images/logo.jpg")

server <- function(input, output, session) {
  
  output$id.Histograma <-
    renderPlot({
      ggplot(data = df_Bolao) +
        # background_image(img) +
        geom_histogram(mapping = aes(x = Valor)) +
        # ggtitle(label = "histograma das apostas") +
        theme_minimal() + 
        scale_x_continuous(breaks = pretty(range(df_Bolao$Valor),
                                           n = nclass.Sturges(df_Bolao$Valor),
                                           min.n = 1),
                           lim = c(0, 1000)) 
      
                })
  
  
  # output$id.Logo <-
  #   renderImage({
  #     filename <- 
  #       normalizePath(file.path('./images','logo.jpg'))
  #     
  #     list(src = filename,
  #          contentType = 'image/png'
  #          )
  #     
  #   }, deleteFile = FALSE)
  
  
  
  output$id.wordCloud <- 
     renderPlot({
       wordcloud(
         words = df_Bolao$Nome,freq = df_Bolao$fatia
         ,min.freq = 20
         ,max.words = 100
         ,scale = c(3.0,.09)
         ,random.order = FALSE
         ,rot.per = 0.35
         ,colors = brewer.pal(8, "Dark2")
         )
                  })
    
  
  output$id.Tabela <- 
    renderReactable({
      reactable(df_Bolao[,c("Nome","Valor")] 
                ,columns = list(
                  Valor = colDef(align = "center"
                                 ,name = "Valor(R$)")
                  # ,Nome = colDef(footer = "Se não encontrou seu nome escreva para: humberto.laserna@gmail.com")
                                )
                ,resizable = T
                ,filterable = T
                ,sortable = T
                ,pagination = T
                ,showSortable = T
                ,striped = T
                )
                    })
  
}





