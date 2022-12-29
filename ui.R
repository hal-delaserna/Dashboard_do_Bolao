
# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("Bolão da Equiparação"),

    # sidebarLayout(
    #     sidebarPanel(
    #         # sliderInput(inputId = "id.Slider.Valor",
    #         #             "Valor da Aposta:",
    #         #             min = min(df_Bolao$Valor),
    #         #             max = max(df_Bolao$Valor),
    #         #             value = 30)


           
           fluidRow(column(6,plotOutput("id.Histograma"))
                   ,column(6,wordcloud2Output("id.wordCloud")))
          ,fluidRow(column(12,reactableOutput('id.Tabela')))
    )


# SOMENTE 2 DOS 3 OUTPUTS SÃO RENDERIZADOS. 
# ULTRAPASSOU LAYOUT? (MUDE LAYOUT)