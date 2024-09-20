#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


library(shiny)
data(morley)


# Define server logic required to plot light speed measurements
shinyServer(function(input, output, session) {
    
    ThePlot <- reactive({
        set <- c()
        if(input$exp1) {
            set <- c(set,1)
        }
        if(input$exp2) {
            set <- c(set,2)
        }
        if(input$exp3) {
            set <- c(set,3)
        }
        if(input$exp4) {
            set <- c(set,4)
        }
        if(input$exp5) {
            set <- c(set,5)
        }
        if(!is.null(set)) {
            foo <- morley[morley$Expt %in% set,]
            plot(x = foo$Run, y = foo$Speed, 
                 type = "p", 
                 xlab = "Run", 
                 ylab = "Speed",
                 main = "Morley's Light Speed Measurements"
                 )
        }
    })

    lightMean <- reactive({
        set <- c()
        if(input$exp1) {
            set <- c(set,1)
        }
        if(input$exp2) {
            set <- c(set,2)
        }
        if(input$exp3) {
            set <- c(set,3)
        }
        if(input$exp4) {
            set <- c(set,4)
        }
        if(input$exp5) {
            set <- c(set,5)
        }
        if(!is.null(set)) {
            mean(morley[morley$Expt == set, "Speed"])
        }
    })

    lightSD <- reactive({
        set <- c()
        if(input$exp1) {
            set <- c(set,1)
        }
        if(input$exp2) {
            set <- c(set,2)
        }
        if(input$exp3) {
            set <- c(set,3)
        }
        if(input$exp4) {
            set <- c(set,4)
        }
        if(input$exp5) {
            set <- c(set,5)
        }
        if(!is.null(set)) {
            sd(morley[morley$Expt == set, "Speed"])
        }
    })

    output$speedsPlot <- renderPlot({
        ThePlot()
    })

    output$mean <- renderText({
        lightMean()
    })

    output$sd <- renderText({
        lightSD()
    })
})
