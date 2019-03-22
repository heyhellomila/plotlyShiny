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
  theme="bootstrap.min.css", #external bootswatch theme outside of shinythemes package
  titlePanel("Mila's First Tinkering with Shiny App for Motor Trend Car Road Tests"),
  DT::dataTableOutput("plotlytable"),
  
  sidebarLayout(
    sidebarPanel(
      
      actionButton("Click", "Me!"),
      
      #Demonstrating Dropdown Menu
      selectInput("select", label = h3("Memes that won the Internet's Heart?"), 
                  choices = list("NyanCat" = 1, "Charlie Bit Me" = 2, "Dramatic Chipmunk" = 3), 
                  selected = 1),
      sliderInput("sampleSize", "Please Select Sample Size:", 1, 500, 30),
     #conditionalPanel(condition = input.Distribution == "Normal",
                       #textInput("mean", "Please Select the Mean", 5)),
      #textInput("Standard Deviation", "Select the Standard Deviation")),
    #conditionalPanel(condition = input.Distribution == "Exponential",
                     #textInput("lambda", "Select Sample Size: ", min=1, max=500, value=30, step=5),
    ),
    mainPanel(
      plotOutput("plotlyShiny")
    )
  )
)
server <- function(input, output) {
  output$plotlytable = DT::renderDataTable({
    mtcars
  })
}

shinyApp(ui, server)

