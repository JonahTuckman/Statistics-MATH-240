# Data Source: https://catalog.data.gov/dataset/energy-generation-by-state-and-technology-2009/resource/bb0da868-f498-4c47-b61f-da217897198f
### Exxon: Texas 
### Chevron: California 
### ConnocoPhillips: Texas
### Occidental Petroleum Company: Texas
### Valero Industries: Texas
### Phillips 66: Texas

library("ggpubr")
library("ggplot2")
library("dplyr")
library(tidyverse)


setwd('/Users/JonahTuckman/Desktop/Statistics/Statistics-MATH-240/Final Project')


statsData <- read.csv('State RE Generation-Table 1.csv') 
neededCols <- c("State","Solar")
statsData <- statsData[neededCols]
write.csv(statsData, "SolarData.csv")


statsData <- read.csv("SolarData.csv")
statsData['X'] <- NULL ## Deleted unneeded column

replaceCommas<-function(X){
  X<-as.numeric(gsub("\\,", "", X))
}

statsData$Solar <- replaceCommas(statsData$Solar)

RepData <- subset(statsData, statsData$Voting == 'R')
DemData <- subset(statsData, statsData$Voting == 'D')

demSolarNum <- subset(DemData, DemData$Solar>0)
demSolarPerc <- (nrow(demSolarNum) / nrow(DemData) * 100)
print(demSolarPerc)
## 28.57% of Democratic States have a positive solar output

RepSolarNum <- subset(RepData, RepData$Solar > 0)
RepSolarPerc <-(nrow(RepSolarNum) / nrow(RepData) * 100)
print(RepSolarPerc)
