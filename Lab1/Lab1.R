<!-- Instructions: This is the template you will use to type up your responses to the exercises and the on your own questions. To produce a document that you can print out and turn in just click on Knit HTML above. All you need to do to complete the lab is to type up your BRIEF answers and the R code (when necessary) in the spaces provided below. If you want to find out more about the markdown language click on the MD icon. -->
  
  Lab 1 
========================================================
  
  #### Team name: Team 4
  
  #### Author: Jonah, Miranda, Manavi, Charlotte, Lucy
  
  #### Discussants (other team members present in lab): 
  
  
  
  install.packages("ggplot2")
  library("ggplot2")
  ### Exercises

#### Load CDC data:

```{r}
source("http://www.openintro.org/stat/data/cdc.R")
names(cdc)
```

#### Exercise 1: 
head(cdc)
tail(cdc)
# There are 20000 responses in the dataset. There are 9 variables in the dataset.
# genhlth -> ordinal categorical
# exerany -> unordered (regular) categirical
# hlthplan -> regular categorical
# smoke100 -> regular categorical 
# height -> continuous 
# weight -> continuous 
# wtdesire -> continuous 
# age -> continuous
# gender -> regular categorical 


summary(cdc$weight)
table(cdc$smoke100)/20000  # percentage
barplot(table(cdc$smoke100))


#### Exercise 2:


```{r}
summary(cdc$height) # 1st -> 64.00 3rd -> 70.00
summary(cdc$age) # 1st -> 31.00 3rd -> 57.00

IQRHeight <- (70 - 64)
IQRAge <- (57.00 - 31.00)


table(cdc$gender)
#9569 males in the sample

table(cdc$genhlth)/20000
# 23% are in excelent health

```

#### Exercise 3:


```{r}
mosaicplot(table(cdc$gender, cdc$smoke100))
# This revealed that slightly more males smoke than females. 

```


#### Exercise 4:

```{r fig.width=7, fig.height=5}
under23_and_smoke <- subset(cdc, cdc$age < 23 & cdc$smoke100 == 1)
```

#### Exercise 5:



```{r}
bmi <- (cdc$weight/cdc$height^2) * 703
boxplot(bmi ~ cdc$genhlth)

# This plot shows the bmi in accordance to thier general health.
# This is an obvious correlation that shows how bmi rises as general
# health becomes worse.

boxplot(bmi ~ cdc$exerany)
# This plot shows that bmi goes down as exercise increases. 
# These have a correlation because as you exercise more, BMI goes down.

```

#### Exercise 6:

```{r fig.width=7, fig.height=5}
plot(cdc$weight, cdc$wtdesire, type = 'p') # Plot of points
plotttt <- ggplot(cdc, aes(x = cdc$weight,y = cdc$wtdesire)) + geom_point() + geom_smooth()
plotttt
# Plot of points as well as regression line



# This plot shows a regression line that seems to be ~ y = x
# This shows a correlation of people giving desired weights that are 
# relatively close to their current weight. 
# This is why the (estimated) regression lines has a slope of ~1. 
```

```{r fig.width=7, fig.height=5}

```