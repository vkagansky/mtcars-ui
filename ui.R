# ui.R
library(shiny)

shinyUI(fluidPage(
  titlePanel("Milege Analysis using GUI"),
  
  sidebarLayout(
    sidebarPanel(

      helpText("This application is related to the Regression class 
        project.  The goal was to explore factors affecting the mailege
        per gallon. This application illistrates how it could be done using
        UI."),
    

      helpText("My approach was a bit unusual - to start with a
       reasobably good model and try to improve it."),
    


      helpText("Evidently, milege depends on the weight (wt) and
      power of the car (hp, qsec, or both).  This application allows 
      to select other variables while making sure that wegth and 
      one of the power characteristics are in the model"),

      helpText("So wt is always included; you can choose to select 
      hp, qsec, or both using radio button and can add more variables
      using checkbox group below"),
    
    
      br(),

      helpText(h5("wt")),

      br(),

      radioButtons("radio", label = h5("Power Characteristic"),
        choices = list("hp" = 'hp', "qsec" = 'qsec',
                       "both" = 'both'),selected = 'hp'),
 
      br(), 

      checkboxGroupInput("checkboxGroup", 
        label = h5("Other Variables"), 
        choices = list("cyl" = 'cyl', 
           "disp" = 'disp', "drat" = 'draft',
           "vs" = 'vs',  "am" = 'am',  
           "gear" = 'gear',  "carb" = 'carb'
         ),
        selected = 'cyl'
       )


    ),
    
    mainPanel(
     textOutput("note"),
     verbatimTextOutput("fit"),
     plotOutput("figures")

    )
  )
)) 
