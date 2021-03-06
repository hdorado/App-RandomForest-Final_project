source("FunAppRF.R")
library(ggplot2)
library(randomForest)

baseDatos <- NULL

shinyServer(function(input,output) {
    #Lectura de la base de clima

    y <- list.files(,pattern = "csv")
    
    output$datasetslc <- renderUI({
        selectInput("dataSet","Selct a dataset",as.list(y)) 
    })
    
    baseDatos <- reactive({
        
        dataBase <- input$dataSet
        
        
        baseFinal <- if (is.null(dataBase)){NULL}else{
            dPvalBase <- dataBase
            path <- substring(dPvalBase,nchar(dPvalBase)-2,nchar(dPvalBase))
            
            while(is.null(dataBase)|path!="csv"){
                validate(need(!is.null(dataBase)& path=="csv" ,
                              "No se han cargado datos de clima en formato csv"))
            }   
            
            read.csv(dataBase)} 
        
        
        return(baseFinal)
    })    
    
    namBD <- reactive({names(baseDatos())}[-1])
    
    output$namsx <- renderUI({
        selectInput("xvar","Variable X",as.list(namBD())) 
    })
    
    output$namsy <- renderUI({
        selectInput("yvar","Variable Y",as.list(namBD())) 
    })
    
    
    output$baseDatos <- renderTable({     
        if(is.null(baseDatos()))
            return(NULL)
        baseDatos()[1:5,]
    })
    
    
    selectVars <- reactive({if (is.null(baseDatos())){c(1,2)}
                           else{c(input$xvar,input$yvar)}})
    
    
    output$plotDescrip <- renderPlot(
        if(is.null(baseDatos()))
            return(NULL)
        else{
            
            if(length(selectVars())!=2){ 
                    NULL}else{
            ggdescriptive(baseDatos(),selectVars()[1],selectVars()[2])
                    }
        }
    )
    
    output$plotRelevance <- renderPlot(
        if(is.null(baseDatos()))
            return(NULL)
        else{
            importRelevance(baseDatos())
        }
    )
    
})
