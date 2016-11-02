##########Shiny Server######################



shinyServer(function(input,output,session){
  
  output$map <- renderLeaflet({
    
    mapcol<- colorFactor(c("Green","cadetblue","darkseagreen"),levels=c("L","M","H"))
    
    leaflet()%>%
      addProviderTiles("CartoDB.Positron")%>%
      setView(-73.3,41.6,zoom=8)%>%
      addCircleMarkers(data=DSites,lng=DSites$XLong,lat=DSites$YLat,
                       #popup=paste(sep="<br/>",DSites$Station_Name,paste("SID", DSites$site)),
                       radius=5,stroke=FALSE,fillColor=~mapcol(DSites$TP_CAT),fillOpacity=1,layerId=~DSites$site)%>%
      addLegend(position="bottomright",colors=c("cadetblue","darkseagreen","Green"),labels=c("Low","Medium","High"),
                title="Average TP (mg/L) /br category")
  })
  
  
  #Update the map select#
  observeEvent(input$map_marker_click, {
    p <- input$map_marker_click
    if(p$id=="Selected"){
      leafletProxy("map") %>% removeMarker(layerId="Selected")
    } else {
      leafletProxy("map") %>% setView(lng=p$lng, lat=p$lat, zoom=10) %>%
        addCircleMarkers(p$lng, p$lat, radius=10, color="black",
                         fillOpacity=0, opacity=1, stroke=TRUE,
                         layerId="Selected")
    }
  })
  
  
  #Update the select input with map click#
  
  observeEvent(input$map_marker_click, {
    p <- input$map_marker_click
    if(!is.null(p$id)){
      if(is.null(input$ID)) updateSelectInput(session, "ID", selected=p$id)
      if(!is.null(input$ID) && input$ID!=p$id) updateSelectInput(session, "ID", selected=p$id)
    }
  })
  
  
  #Update the map and view on select input changes#
  
  observeEvent(input$ID, {
    p<- input$map_marker_click
    p2 <- subset(DSites, site==input$ID)
    if(nrow(p2)==0){
      leafletProxy("map") %>% removeMarker(layerId="Selected")
    } else {
      leafletProxy("map") %>% 
        setView(lng=p2$XLong, lat=p2$YLat,zoom=10) %>%
        addCircleMarkers(p2$XLong, p2$YLat, radius=10, color="black",
                         fillOpacity=0, opacity=1, stroke=TRUE, 
                         layerId="Selected")
    }
  })
  
  
  output$DMplot <- renderPlot({
    SdTP<- subset(dTP,ID==input$ID)
    var<- switch(input$Env,
                 "TP"=SdTP$TP,
                 "T"=SdTP$T,
                 "S"=SdTP$S)
    rects <- switch(input$Env,
                    "T"=data.frame(ystart = c(0,0.066115702,0.203333333), yend = c(0.066115702,0.203333333,1), 
                                   TP_Index = c("Low","Medium","High")),
                    "S"=data.frame(ystart = c(0,0.124330118,0.353037767), yend = c(0.124330118,0.353037767,1), 
                                   TP_Index = c("Low","Medium","High")),
                    "TP"=data.frame(ystart = c(0,0.02,0.065), yend = c(0.02,0.065,1.2), 
                                    TP_Index = c("Low","Medium","High")))
    plotnm<- switch(input$Env,
                    "T"="Relative Abundance of \nTolerant TP Indicator Diatoms",
                    "S"="Relative Abundance of \nSensitive TP Indicator Diatoms",
                    "TP"="Total Phosphorus (mg/L)\n Categories")
    scalebrk<- switch(input$Env,
                      "T"=c(0,0.05,0.25,0.5,1),
                      "S"=c(0,0.05,0.25,0.5,1),
                      "TP"=c(0,0.05,0.25,0.5,1.2))
    
    plotcol<- switch(input$Env,
                     "T"=c("Green","cadetblue","Light Green"),
                     "S"=c("cadetblue","Green","Light Green"),
                     "TP"=c("Green","cadetblue","Light Green"))
    
    ggplot()+
      geom_rect(data=rects,aes(xmin=0,xmax=((dim(SdTP)[1])+1),ymin=ystart,ymax=yend,fill=TP_Index),alpha=0.5)+
      scale_fill_manual(name=plotnm,
                        breaks=c("High","Medium","Low"),
                        values=plotcol)+
      geom_point(data=SdTP,aes(x=YEAR,y=var),shape=24,colour="black",size=1,stroke=3)+
      scale_x_discrete(name="Sample Year")+
      scale_y_continuous(trans="sqrt",breaks=scalebrk)+
      labs(title=SdTP$Station.Name)+
      theme(title=element_text(size=12),legend.position="top",legend.direction="horizontal",legend.text=element_text(size=9),
            legend.title=element_text(size=11),axis.title.y=element_blank(),axis.title.x=element_blank(),
            axis.text=element_text(size=9),axis.text.x=element_text(size=9),axis.text.y=element_text(size=9))
    
  },
  width=400,
  height=300
  )
  
  #Download File - N.B.dowload will not work in RStudio Viewer#
  
  output$downloadData <- downloadHandler(
    filename=function(){
      paste(input$ID,".csv",sep="")
    },
    content=function(file) {
      write.csv(subset(dTP,ID==input$ID),file)
    }
  )
  
  
  ######TP Management Map##########  
  output$TPmap <- renderLeaflet({
        
    mapcol2<- colorFactor(c("chartreuse","aquamarine","lightseagreen","lightskyblue","lightblue","gray"),
                          levels=c(">75","50-75","25-50","0-25","Cap","NA"))
        
        leaflet()%>%
          addProviderTiles("CartoDB.Positron")%>%
          setView(-73.3,41.6,zoom=9)%>%
          addPolygons(data=TPBasin,stroke=TRUE,color="black",weight = 1,fillColor=~mapcol2(TPBasin$RedCAT),
                      layerId=TPBasin$RBAS_NO)%>%
          addLegend(position="bottomright",colors=c("chartreuse","aquamarine","lightseagreen","lightskyblue","lightblue","gray"),
                    labels=c("> 75%","50 - 75%","25 - 50%","1 - 25%","Cap","NA"),title="Full Implementation <br> TP Percent Reduction")
    
  })
  
  
  
  #Update the plot with map hover#
  
  output$TPMgntPlot <- renderPlot({
    x <- input$TPmap_shape_mouseover
    basin<- subset(TPBasin.df,RBAS_NO==x$id)
    rects <- data.frame(ystart = c(0,8,26,35), yend = c(8,26,35,127),
                        TP_Index = c("Low","Medium Low","Medium High","High"))
    ggplot()+
      geom_bar(data=basin,aes(x=factor(CAT,levels=c("Pre-Management","2015","Future")),y=Yield),stat="identity",colour="black")+
      geom_rect(data=rects,aes(xmin=0,xmax=4,ymin=ystart,ymax=yend,fill=TP_Index),alpha=0.4)+
      scale_fill_manual(name="TP Yield Category",
                        breaks=c("High","Medium High","Medium Low","Low"),
                        values=c("chartreuse","lightskyblue","aquamarine","lightseagreen"))+
      ylim(0,127)+
      labs(title=paste("Estimated TP Yield (kg/km2)\n",basin$REGIONAL,"Regional Basin",sep=" "))+
      theme(legend.position="top",legend.direction="horizontal",
            axis.title.x=element_blank(),title=element_text(size=12),
            axis.title.y=element_blank())
    
  },
  height=300)
  
  #Download File - N.B.dowload will not work in RStudio Viewer#
  
  output$downloadTPYieldData <- downloadHandler(
    filename="TPYieldData.csv",
    content=function(file) {
      write.csv(TPBasin.df,file)
    }
  )
  
})