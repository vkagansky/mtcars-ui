library(shiny)
data(mtcars)


shinyServer(function(input, output) {

  output$note <- renderText ("Note: only selected variables participate in regression")


  output$fit <- renderPrint({ 

    switch (input$radio,
   "both" = {col_list <- c ("mpg", "wt", "hp", "qsec")} ,
   "hp"   = {col_list <- c ("mpg", "wt", "hp")} ,
   "qsec" = {col_list <- c ("mpg", "wt", "qsec")} )

    nm <- col_list
    if ( length (input$checkboxGroup) )
      { nm <- c(col_list, unlist(strsplit(input$checkboxGroup,' ')) ) }

    col_list <- c()
    for (i in 1:length( names(mtcars)) ) {
      if (names(mtcars)[i] %in% nm)
        { col_list <- append(col_list,i) }
    }
    mtcars.sub <- subset(mtcars, select= col_list)
 
    fit <- lm(mpg ~ ., data=mtcars.sub)
    summary(fit)
    

    })
    

  output$figures <- renderPlot({ 

    switch (input$radio,
   "both" = {col_list <- c ("mpg", "wt", "hp", "qsec")} ,
   "hp"   = {col_list <- c ("mpg", "wt", "hp")} ,
   "qsec" = {col_list <- c ("mpg", "wt", "qsec")} )

    nm <- col_list
    if ( length (input$checkboxGroup) )
      { nm <- c(col_list, unlist(strsplit(input$checkboxGroup,' ')) ) }

    col_list <- c()
    for (i in 1:length( names(mtcars)) ) {
      if (names(mtcars)[i] %in% nm)
        { col_list <- append(col_list,i) }
    }
    mtcars.sub <- subset(mtcars, select= col_list)
 
    fit <- lm(mpg ~ ., data=mtcars.sub)
    layout(matrix(c(1,2,3,4),2,2))
    plot(fit)
    
    })

    



})
