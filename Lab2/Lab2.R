


setwd('/Users/JonahTuckman/Desktop/Statistics/Statistics-MATH-240/Lab2')
download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")



#### Excercise 1 -> Describe the population .
area <- ames$Gr.Liv.Area
price <- ames$SalePrice

summary(area)
summary(price)


hist(area)

samp0 <- sample(area,50)
summary(samp0)


#### Exersice 2 -> random sample
set.seed(127)
samp1 <- sample(area, 50)
summary(samp1)


### Excercise 3 -> Describe new sample




###