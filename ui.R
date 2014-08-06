library(shiny)
library(ggplot2)
 
dataset <- diamonds
 
shinyUI(fixedPage(
 
  titlePanel("Health Coach Force-Directed Graph"),
  tags$audio(src="https://dl.dropboxusercontent.com/u/4316524/Michigan__The_Victors.mp3", type="audio/mp3", autoplay=TRUE),
  sidebarPanel(
 
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1000, nrow(dataset)), step=500, round=0),
    
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth'),
    
    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),
 
  mainPanel(
    plotOutput('plot')
  )
))