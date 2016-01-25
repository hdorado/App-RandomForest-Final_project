

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
               
               p("This application is for exploring data sets with numeric targets using bivariate analysis
                 and the variable importance for  Random Forest."),
             br(),
             p("The user can select the data set that want to explore, there are
               three possibilities. If he want to use other database, he can
               save it into the folder using the same structure of the others. 
               Remember that the file have to be in csv format."),
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
                   p("The first five row from the dataset are:",align="center"),
                div(tableOutput("baseDatos"),align="center"),
            h3(strong('Exploratory data analysis'),align = "center" ),
            br(),
            p("A scatterplot for quantitative variable and a box plot for 
              qualitative variables, could be generated. 
              The user can select the features that want to include in the graph,
              when both x and y are  quantitative a Lowess smoother is added to
              the graphic."),
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
                br(),
                p('You can appreciate the order of relevant inputs features to 
                  explain the output in the graph below. Higher is the mean 
                  variable importance, most relevant  is for the output.'),
                
                plotOutput("plotRelevance")
            )
        )
    )
)

