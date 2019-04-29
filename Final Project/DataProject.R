# Data Source: https://catalog.data.gov/dataset/energy-generation-by-state-and-technology-2009/resource/bb0da868-f498-4c47-b61f-da217897198f


library("ggpubr")
library("ggplot2")
library("dplyr")
install.packages("tidystats")
library(tidystats)


setwd('/Users/JonahTuckman/Desktop/Spring2019/Statistics/Statistics-MATH-240/Final Project')


statsData <- read.csv('State RE Generation-Table 1.csv') ## Original dataset with many extra energy types

neededCols <- c("State","Solar") ## Focusing on states and Solar output
statsData <- statsData[neededCols] ## Taking only those columns stated above
Voting <- read.csv("Voting.csv")
statsData <- merge(statsData, Voting, by="State")
write.csv(statsData, "SolarData.csv") ## Writing this new file


statsData <- read.csv("SolarData.csv") ## Reading this new file
statsData['X'] <- NULL ## Deleted unneeded column

replaceCommas<-function(X){
  X<-as.numeric(gsub("\\,", "", X))
}

statsData$Solar <- replaceCommas(statsData$Solar)
statsData <- transform(statsData, Republican = ifelse(statsData$Voting == 'R', 1,0))

### Remove NA values
statsData$Republican[is.na(statsData$Republican)] <- 0
statsData$Solar[is.na(statsData$Solar)] <- 0

statsData <- transform(statsData, SolarPositive = ifelse(statsData$Solar > 0, 1, 0))
keepers <- c("State", "Republican", "SolarPositive")
BooleanData <- statsData[keepers]
BooleanData[is.na(BooleanData)] <- 0
statsData <- transform(statsData, SolarAndRep = ifelse(statsData$Republican == 1 & statsData$SolarPositive == 1, 1, 0))
statsData <- transform(statsData, SolarAndDem = ifelse(statsData$Republican == 0 & statsData$SolarPositive == 1, 1, 0))



RepData <- subset(statsData, statsData$Voting == 'R')
DemData <- subset(statsData, statsData$Voting == 'D')

demSolarNum <- subset(DemData, DemData$Solar>0)
demSolarPerc <- (nrow(demSolarNum) / nrow(DemData) * 100)
print(demSolarPerc)
## 28.57% of Democratic States have a positive solar output

RepSolarNum <- subset(RepData, RepData$Solar > 0)
RepSolarPerc <-(nrow(RepSolarNum) / nrow(RepData) * 100)
print(RepSolarPerc)
## 4.34% of Republican States have a positive solar output


### Show Data
countsRep <- table(RepData$Solar < 1, RepData$Solar > 1)
barplot(countsRep, main="Republican Solar Usage", horiz=TRUE,
        xlab = "Political Alignment", col = c("darkblue", "red"),
        legend = rownames(countsRep), xlim = c(0, 30), ylim = c(0, 3))

countsDem <- table(DemData$Solar < 1, DemData$Solar > 1)
barplot(countsDem, main="Democratic Solar Usage", horiz=TRUE,
        xlab = "Political Alignment", col = c("darkblue", "red"),
        legend = rownames(countsDem), xlim = c(0, 30), ylim = c(0, 3))

boxplot(statsData$Solar ~ statsData$Republican, data = statsData, main="Party Breakdwon", 
        xlab="Republican?", ylab="Solar Output")

#### Now to used combined data in plot
boxplot(BooleanData$SolarPositive ~ BooleanData$Republican, data = BooleanData, main="Party Breakdwon", 
        xlab="0 = Democrat, 1 = Republican", ylab="Solar Output")

barplot(BooleanData, main="Democratic Solar Usage", horiz=TRUE,
        xlab = "Political Alignment", col = c("darkblue", "red"),
        legend = rownames(countsDem), xlim = c(0, 30), ylim = c(0, 3))


### Probabilities 
PSolarGivenRepublican <-nrow(RepSolarNum) / nrow(RepData)
print(PSolarGivenRepublican)

PSolarGivenDemocrat <- nrow(demSolarNum) / nrow(DemData)
print(PSolarGivenDemocrat)

### Bayes Theorem 
numSolarPositive <- subset(statsData, statsData$SolarPositive >0)
pSolarPositive <- nrow(numSolarPositive)
print(pSolarPositive)

numRepublicanStates <- subset(statsData, statsData$Republican == 1)
numRepublicanStates <- nrow(numRepublicanStates)
print(numRepublicanStates)


#### Confidence intervals 
inference(RepData$SolarPositive, type = "ci", est = "mean", method = "simulation", boot_method = "se",
          success = 1)
# 95 % Bootstrap interval = ( -0.0422 , 0.1331 )
inference(DemData$SolarPositive, type = "ci", est = "mean", method = "simulation", boot_method = "se",
          success = 1)
# 95 % Bootstrap interval = ( 0.1195 , 0.4519 )

### The democratic 95% confidence interval does not include 0 in the range, the republican does. 
### This indicates that we are more confident that the democratic solar output (in a binary exploration), 
### will be greater than 0 than we are that the republican binary exploration will. 



### T Test



t.test(statsData$SolarPositive ~ statsData$Republican, data = statsData)
### P val is less than .05 -> Reject the null. 
### This means that there is a significant different between republicans and democrats with solar output positive 
