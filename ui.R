#
# This is the user-interface definition of a TrialCurate application. You can
# run the application by clicking 'Run App' above.
#

# Required library
library(shiny)
library(bslib)
library(mongolite)
library(jsonlite)
library(httr)
library(tidyverse)
library(shinyWidgets)
library(shinyFiles)
library(DT)
library(shinyjs)
library(config)
library(data.table)
library(dplyr)
library(here) 

# sourced the files 
source(here("R", "curateUI.R"))
source(here("R", "curateServer.R"))


# Define UI for application that draws a histogram
ui <- tagList(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ), 
  useShinyjs(),
  navbarPage(
    title = "TrialCurate", 
    
    tabPanel("Add Trial",
             
             tabsetPanel(
               id = 'inNav',
               
               # Curate Query
               tabPanel("NCT ID", 
                        input_form),
               
               # Disease 
               tabPanel("Disease",
                        dise_form),
               
               # Biomarker 
               tabPanel("Biomarker",
                        biom_form),
               
               # Documentation
               tabPanel("Documents",
                        doc_form),
               
               # View trial before submitting to database
               tabPanel("View Trial",
                        dis_form )
               
             )),
   
    theme = bs_theme(version = 5, 
                     bootswatch = "cosmo",
                     primary = "#246725")
    
  )
)

