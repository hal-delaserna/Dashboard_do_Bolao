library(gapminder)
library(ggplot2)
library(plotly)
library(dplyr)
library(shiny)

df_Bolao <- 
  readRDS("./data/df_Bolao.Rds")

df_Bolao$fatia <-
  100*
  (df_Bolao$Valor/sum(df_Bolao$Valor)) |> round(4) |> sort()


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Bolão da Equiparação"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "id.Slider.Valor",
                        "Valor da Aposta:",
                        min = min(df_Bolao$Valor),
                        max = max(df_Bolao$Valor),
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("id.Histograma")
           ,plotOutput("id.Scatter")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$id.Histograma <- renderPlot({
        hist(df_Bolao$Valor, breaks = 30, col = 'darkgray', border = 'white',
             xlab = 'Aposta (R$)', ylab = "Nº de Servidores",
             main = 'Histograma das Apostas')
      })
    
    
    
    output$id.Scatter <- renderPlot({
      
      # p <- 
      #   gapminder %>%
      #   ggplot(data = df_Bolao, aes(Valor, fatia #,size = pop, color=continent
      #                               )) +
      #   geom_point() +
      #   theme_bw()
      # 
      # ggplotly(p)
      ggplotly(
        ggplot(data = df_Bolao, aes(x = Nome, y = Valor)) + 
        geom_point() + 
        theme_bw()
      )

    })
    
    
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
