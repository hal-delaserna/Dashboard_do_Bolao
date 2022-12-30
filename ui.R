
header <- dashboardHeader(title = "Dashboard do Bolão")

sidebar <- dashboardSidebar(disable = T)

body <- dashboardBody(
  
  
  fluidRow(
    valueBox(
       width = 3
      ,nrow(df_Bolao)
      ,"Total de Apostadores"
      ,icon = icon("sack-dollar")
    ),
    valueBox(
       width = 3
      ,paste("R$",median(df_Bolao$Valor))
      ,"É a mediana"
      ,color = "green"
      ,icon = icon("dollar-sign")
    ),
    valueBox(
       width = 3
      ,paste("R$",getmode(df_Bolao$Valor))
      ,"É o valor mais apostado"
      ,color = "red"
      ,icon = icon("credit-card")
    ),
    valueBox(
       width = 3
      ,paste0("R$",sum(df_Bolao$Valor))
      ,"Arrecadação"
      ,color = "yellow"
      ,icon = icon("money-bill-trend-up")
    ),
  )
  
  ,fluidRow(

     # sliderInput(inputId = "id.Slider.Valor","Valor da Aposta:",min = min(df_Bolao$Valor),max = max(df_Bolao$Valor),value = 30),


      tabBox(
          id = "tabset1"
         # ,height = "250px"
         ,tabPanel("Histograma das Apostas", plotOutput("id.Histograma"))
         ,tabPanel(title = icon("user-group"), reactableOutput('id.Tabela'))
         # ,tabPanel("Tab3", imageOutput('id.Logo'))
      )
   
   #  box(plotOutput("id.Histograma")
   #      ,title = "Histograma das Apostas"
   #      ,collapsible = T
   #      )
   # ,box(reactableOutput('id.Tabela')
   #      ,collapsible = T
   #      )
    ,box(plotOutput("id.wordCloud")
         ,title = "Principais apostadores"
         ,status = "primary"
         ,solidHeader = TRUE
         )
)

  ,fluidRow(column(12, h5(
  "Esta é uma parcial (já antiga) dos resultados em 30/Dez(manhã). by"
  ,a("hal-delaserna", href="https://github.com/hal-delaserna")
  )))

)


ui <- dashboardPage(header,sidebar,body)







