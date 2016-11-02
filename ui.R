##########Shiny UI####################

source("AboutPrj.R", local=T)

# for shinyapps.io, use theme="spacelab.css" with file in www folder.
# for local/RStudio and shiny-server, use theme="http://bootswatch.com/spacelab/bootstrap.css" (this is ignored on shinyapps.io)
# shinytheme() from shinythemes package must be avoided because it conflicts with bsModal in shinyBS.


shinyUI (navbarPage(#theme="spacelab.css",
                         collapsible=TRUE,
                         title=div("CT Dept of Energy and Environmental Protection",
                                   img(src="deeplogo.png",height=30,width=30,style="float:left;margin-right: 10px")),
                         windowTitle=("CT DEEP TP Research"),
                         
                         ##Research Tab##
                         tabPanel("Research",
                                  div(class="outer",
                                      tags$style(type="text/css",".outer{position: fixed;top: 41px;left: 0;
                                                 right: 0;bottom: 0;overflow: hidden;padding: 0;}"),
                                      leafletOutput("map",width="100%",height="100%"),
                                      absolutePanel(top=20,left=60,height=20,width=1000,
                                                    h3("Aquatic Life Impacts of Total Phosphorus (TP) Project")
                                      ),
                                      
                                      absolutePanel(id = "controls", class = "panel panel-default", fixed = FALSE,
                                                    draggable = FALSE, top = 100, left = 60, right = "auto", bottom = "auto",
                                                    width = 400, height = 400,
                                                    h4("Explore Metrics"),
                                                    selectInput("ID","Select stream below or click a site on the map:",choices=c("",nm)),
                                                    selectInput("Env","Metric:",choices=
                                                                  c("Tolerant TP Diatoms"="T","Sensitive TP Diatoms"="S",
                                                                    "Total Phosphorus"="TP")),
                                                    plotOutput("DMplot")
                                      ),
                                      absolutePanel(top=620,left=60,height=20,width=400,
                                                    tags$strong("See 'About Project' tab for more information on metrics")),
                                      absolutePanel(top=640,left=60,height=20,width=100,
                                                    downloadButton("downloadData","Download All Metric Data for this Site")
                                      )
                                  )
                                  
                                  
                         ),
                         
                         ##Management Tab##
                         tabPanel("Management",
                                  div(class="outer",
                                      tags$style(type="text/css",".outer{position: fixed;top: 41px;left: 0;
                                                 right: 0;bottom: 0;overflow: hidden;padding: 0;}"),
                                      leafletOutput("TPmap",width="100%",height="100%"),
                                      absolutePanel(top=20,left=60,height=20,width=1000,
                                                    h3("Total Phosphorus (TP) Management in CT Freshwater Streams")
                                      ),
                                      absolutePanel(id = "controls", class = "panel panel-default", fixed = FALSE,
                                                    draggable = FALSE, top = 100, left = 60, right = "auto", bottom = "auto",
                                                    width = 400, height = 400,
                                                    h4("Explore Management Efforts"),
                                                    tags$em("Hover over regional basin on map to view estimated TP yield reductions over time"),
                                                    plotOutput("TPMgntPlot")
                                                    # )
                                      ),
                                      absolutePanel(top=500,left=60,height=20,width=400,
                                                    tags$strong("See 'About Project' tab for more information on data used")),
                                      absolutePanel(top=525,left=60,height=20,width=100,
                                                    downloadButton("downloadTPYieldData","Download All TP Yield Data"))
                                      )
                         ),
                        
                         about
                         ))