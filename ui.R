

baseFinal <- NULL

shinyUI(
    fluidPage(  tags$head(
        tags$style(HTML('#run{background-color:orange}'))
    ),
        fluidRow(
            
        
            column(12,
               
            titlePanel(strong("Exploratory analysis and variable importance 
                                 for multivariate data:")),
               br(),
               
               p("This application is for exploring data sets using random forest models. 
                 Once the user has loaded a tidy database, 
                 immediately can start to explore the correlation between two 
                 variables and identify the subset of relevance factors."),
            br()     
          )
        ),
        fluidRow(
           
            column(4,p("") ),
            column(3,    
                  div(uiOutput("datasetslc"),align = "center")        
            ),
            column(3,p(""))
        ),  
        
        fluidRow(
            column(12,
                div(tableOutput("baseDatos"),align="center"),
            h3(strong('Exploratory data analysis'),align = "center" ),
            br(),
            br()
            )        
        ),
        #sidebarPanel(
            
        fluidRow(
            column(6,div(uiOutput("namsx"),align = "center")),
            column(6,div(uiOutput("namsy"),align = "center"))
         #   ) 
        ),
        
        fluidRow(
            column(12,
                plotOutput("plotDescrip"),
                h3(strong("Importance relevance\nRandom Forest"),align="center"),
                plotOutput("plotRelevance")
            )
        )
    )
)
