##Motor Trend Car Road Tests - Built in data set

#Clearing the workspace before running the script in case program produces errors; NB. use browser() -- R will stop and turn the
#console to user.

rm(list=ls())
library(shiny)

#Building the UI Component for Shiny

ui <- fluidPage("Hello World")
# *input() functions,
 =
# *output() functions



#Server instructions

server <- function(input, output) {
  
}


shinyApp(ui = ui, server = server)






my_data <- read.table("/Users/milaroisin/Documents/GitHub/plotShiny/mtcars.csv")
head(mtcars)

#structure of dataset
str(mtcars)

#Getting dimensions of the dataset -- 32 objects with 11 variables
dim(mtcars)
plot(density(mtcars$wt))
summary(mtcars)