# Data Source: https://catalog.data.gov/dataset/energy-generation-by-state-and-technology-2009/resource/bb0da868-f498-4c47-b61f-da217897198f
### Exxon: Texas 

library("ggpubr")
library("ggplot2")
library("dplyr")
library(tidyverse)


setwd('/Users/JonahTuckman/Desktop/Statistics/Statistics-MATH-240/Final Project')

statsData <- read.csv('State RE Generation-Table 1.csv') 
neededCols <- c("State",Solar")
statsData <- statsData[neededCols]
write.csv(statsData, "SolarData.csv")
