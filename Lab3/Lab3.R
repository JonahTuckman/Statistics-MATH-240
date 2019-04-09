<!-- Instructions: This is the template you will use to type up your responses to the exercises and the on your own questions. To produce a document that you can print out and turn in just click on Knit HTML above. All you need to do to complete the lab is to type up your BRIEF answers and the R code (when necessary) in the spaces provided below. If you want to find out more about the markdown language click on the MD icon. -->
  
  Lab 3
========================================================
  library("ggplot2")
library("dplyr")
  
setwd('//Users/JonahTuckman/Desktop/Statistics/Statistics-MATH-240/Lab3')


  ### Exercises
  
  #### Load data:
  ```{r}
  load("nc.Rdata")
  
```

#### Exercise 1:
summary(nc)

#### Exercise 2: 
gained_clean = na.omit(nc$gained)
n = length(gained_clean)
print(n)

nOG = length(nc$gained)
print(nOG)

print(nOG - n)

if(all.equal((nOG-n),sum(is.na(nc$gained)))){
  print("Successful removal of Nas")
} else {
  print("Something is wrong")
}

#### Exercise 3: 

#### Exercise 4: 

#### Exercise 5: 

#### Exercise 6: 

#### Exercise 7:

#### Exercise 8:

#### Exercise 9: 

#### Exercise 10: 

#### Exercise 11: 
