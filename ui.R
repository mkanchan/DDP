shinyUI(pageWithSidebar(
        #####################################
        # Developing Data Products - Course Project
        # Author : Mukesh Kanchan
        # Comment: Tried to use several HTML input widgets. changes on input 
        # widgets are reflected immediately on output. However, I kept a button
        # for change seed delibarely to demonstrate actionButton concept
        # I have used little bit of java script to pass the seed value on click 
        # of button.
        #####################################
        headerPanel("Dynamic plot : Normally distributed random number"),
        sidebarPanel(
                p("Documentation:",a("DevDataProdCourseProject",href="Readme.html", target="_blank")),
                br(),
                br(),
                br(),
                radioButtons("num", "Number of ramdom samples:",
                             c("100" = "100",
                               "200" = "200",
                               "300" = "300",
                               "400" = "400",
                               "500" = "500"), inline=TRUE),
                br(),
                br(),
                checkboxGroupInput("plotType", "Plot type:",
                             c("Point" = "p",
                               "Line" = "l"), selected="p", inline=TRUE),
                br(),
                br(),
                sliderInput('mean', 'Set mean:',value = 1, min = -5, max = 5, step = 0.5,),
                br(),
                sliderInput('sd', 'Set standard deviation:',value = 0.5, min = 0, max = 1, step = 0.05,),
                br(),
                br(),
                numericInput('seed', 'Random Data Seed:', 1234, min = 1, max = 9999, ),
                actionButton('btnSeed','change Seed'),
                tags$script('document.getElementById("btnSeed").onclick = function() {
                                Shiny.onInputChange("seedVal", document.getElementById("seed").value);
                                };
                                ')
                
        ),
        mainPanel(
                selectInput('color', 'Plot color:', choices = c('Black'='black','Red'='red','Blue'='blue','Green'='green')),
                plotOutput('newPlot'),
                h4("Summary:"),
                tableOutput("displayData")
        )
))