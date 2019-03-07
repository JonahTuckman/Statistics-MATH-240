### Lab 2 // Math 241 Statistics 
### Author: Jonah Tuckman


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

mean(samp1)
hist(samp1)

### Excercise 4 -> New Sample

samp2 <- sample(area, 50)
summary(samp2)
mean(samp2)
hist(samp2)


samp3 <- sample(area, 100)
summary(samp3)
mean(samp3)
hist(samp3)

samp4 <- sample(area, 1000)
summary(samp4)
mean(samp4)
hist(samp4)


### Finding the mean 5000 times and plotting it
sample_mean50 <- rep(0, 5000)
for ( i in 1:5000) {
  samp <-sample(area, 50)
  sample_mean50[i] <- mean(samp)
}
hist(sample_mean50)


hist(sample_mean50, breaks = 25)


#### Excercise 6 -> Build a for loop...
sample_mean_small <- rep(0, 100) 
for (i in 1:100){
  temp <- sample(area, 50)
  sample_mean_small[i] <- mean(temp)
}

hist(sample_mean_small, breaks = 20)
  

sample_means10 <- rep(0, 5000)
sample_means100 <- rep(0, 5000)
for (i in 1:5000) {
  samp <- sample(area, 10)
  sample_means10[i] <- mean(samp)
  samp <- sample(area, 100)
  sample_means100[i] <- mean(samp)
}


hist(sample_means10)
hist(sample_means100)
  

par(mfrow = c(3,1))
xlimits = range(sample_means10)
hist(sample_means10, breaks = 20, xlim = xlimits, col = "blue")
hist(sample_mean50, breaks = 20, xlim = xlimits, col = "red")
hist(sample_means100, breaks = 20, xlim = xlimits, col = "green")
  
 
### Excercise 8 
sample_price50 <-sample(price, 50)
hist(sample_price50)


### Excercise 9
for( i in 1:5000){
  temp <- sample(price, 50)
  sample_price50[i] <- mean(temp)
}
hist(sample_price50, breaks = 20)
mean(sample_price50)

### Excercise 10
sample_price150 <- rep(0, 5000)
for(i in 1:5000){
  temp <- sample(price, 150)
  sample_price150[i] <- mean(temp)
}

hist(sample_price150, breaks = 20)
mean(sample_price150)


