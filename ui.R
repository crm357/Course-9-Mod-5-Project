#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application to plot light speed measurements
fluidPage(

    # Application title
    titlePanel("Measuring the Speed of Light"),

    # Sidebar with 5 check boxes, one for each experiment
    sidebarLayout(
        sidebarPanel(
            h5("Select any combination of the 5 experiments"),
            checkboxInput("exp1", "Experiment 1", value = TRUE),
            checkboxInput("exp2", "Experiment 2", value = FALSE),
            checkboxInput("exp3", "Experiment 3", value = FALSE),
            checkboxInput("exp4", "Experiment 4", value = FALSE),
            checkboxInput("exp5", "Experiment 5", value = FALSE),
            ),

        # Show a plot with mean and standard deviation included
        mainPanel(
            plotOutput("speedsPlot"),
            h3("Mean"), 
            textOutput("mean"),
            h3("Standard Deviation"), 
            textOutput("sd")
        )
    )
)
