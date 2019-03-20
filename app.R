##Motor Trend Car Road Tests - Built in data set
#Global Variables
#my_data <- read.table("https://github.com/milaroisin/plotlyShiny/blob/d7e5491a17ac6f0b350920b934bf92c43ba05373/mtcars.csv")
head(mtcars)

#structure of dataset
str(mtcars)

#Getting dimensions of the dataset -- 32 objects with 11 variables
dim(mtcars)
plot(density(mtcars$wt))
summary(mtcars)

#Clearing the workspace before running the script in case program produces errors; NB. use browser() -- R will stop and turn the
#console to user.
rm(list=ls())

library(plotly)
library(shiny)
library(DT)
library(shinythemes)

#ui.R - Building the UI Component for Shiny
# Observer Design Pattern - avoids code smells

ui <- fluidPage(
  shinythemes::themeSelector(),
  theme=shinytheme("cyborg"),
  titlePanel("Motor Trend Car Road Tests"),
  DT::dataTableOutput("plotlytable"),
  
  sidebarLayout(
    sidebarPanel(
    textInput("txt", "Text input:", "text here"),
    sliderInput("slider", "Slider input:", 1, 100, 30),
    actionButton("action", "Button"),
    actionButton("action2", "Button2", class = "btn-primary")
  ),
    mainPanel(plotOutput("plotlyShiny")
    )
  )
)

server <- function(input, output) {
  output$plotlytable = DT::renderDataTable({
    mtcars
  })
}

shinyApp(ui, server)
