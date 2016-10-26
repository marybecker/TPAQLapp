#########global R#######################

library(ggplot2)
library(shiny)
library(plyr)
library(leaflet)
library(rgdal)


dTP<- read.csv("data/TPDiatomMetrics102016.csv",header=TRUE)
dTP$YEAR <- factor(dTP$YEAR)
DSites<- read.csv("data/DiatomSites_AvgMetrics102016.csv",header=TRUE)
nm<-setNames(as.numeric(DSites$site),DSites$SID)
#read in a shapefile. dsn is the folder containing the shapefiles,layer is the shapefile
#For Leaflet Coordinate System that works is GCS_North_American_1983 Datum: D_North_American_1983
#Projected State Plane Does Not Work
TPBasin <- readOGR("data/RBasin_TPYieldRdc.shp",layer="RBasin_TPYieldRdc")
TPBasin.df<- read.csv("data/TPBasinYield.csv",header=TRUE)