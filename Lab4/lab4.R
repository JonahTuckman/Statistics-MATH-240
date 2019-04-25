<!-- Instructions: This is the template you will use to type up your responses to the exercises and the on your own questions. To produce a document that you can print out and turn in just click on Knit HTML above. All you need to do to complete the lab is to type up your BRIEF answers and the R code (when necessary) in the spaces provided below. If you want to find out more about the markdown language click on the MD icon. -->
  
  Lab 4
========================================================
  
  ### Exercises
  setwd('/Users/JonahTuckman/Desktop/Statistics/Statistics-MATH-240/Lab4')

  #### Load inference function:
  ```{r}
load(url('http://s3.amazonaws.com/assets.datacamp.com/course/dasi/inference.Rdata'))
```

#### Load GSS data:
```{r}
gss = read.csv("/Users/JonahTuckman/Desktop/Spring2019/Statistics/Statistics-MATH-240/Lab4/gss_wordsum_class.csv")
```


test = inference(y = gss$wordsum, x = gss$class, est = "mean", method = "theoretical",
          type = "ht", alternative = "greater")

#### Exercise 1:

#### Exercise 2: 

## Group did these parts

#### Load Atheism data:
```{r}
atheism = read.csv("/Users/JonahTuckman/Desktop/Spring2019/Statistics/Statistics-MATH-240/Lab4/atheism.csv")
```

#### Exercise 5: 

## Written response

#### Exercise 6: 

us12 = subset(atheism, atheism$nationality == "United States" & atheism$year == "2012")

#### Exercise 7:

# Another written Response

inference(us12$response, est = "proportion", type = "ci", method = "theoretical",
          success = "atheist")

#### Exercise 8:

# Written response

#### Exercise 9: 

Aust <- subset(atheism, atheism$nationality == "Australia" & atheism$year == "2012")
inference(Aust$response, est = "proportion", type = "ci", method = "theoretical",
          success = "atheist")

Afg <- subset(atheism, atheism$nationality == "Afghanistan" & atheism$year == "2012")
inference(Afg$response, est = "proportion", type = "ci", method = "theoretical",
          success = "atheist") ## Conditions not met

Bulg <- subset(atheism, atheism$nationality == "Bulgaria" & atheism$year == "2012")
inference(Bulg$response, est = "proportion", type = "ci", method = "theoretical",
          success = "atheist")


#### Exercise 10: 

n <- 1000
p <- seq(0, 1, 0.01)
me <- 2 * sqrt(p * (1 - p)/n)
plot(me ~ p)

#### Exercise 11a: 

Spain2005 <- subset(atheism, atheism$nationality == "Spain" & atheism$year == "2005")
inference(Spain2005$response, est = "proportion", type = "ci", method = "theoretical",
          success = "atheist")

Spain2012 <- subset(atheism, atheism$nationality == "Spain" & atheism$year == "2012")
inference(Spain2012$response, est = "proportion", type = "ci", method = "theoretical",
          success = "atheist")

SpainCombined <- subset(atheism, atheism$nationality == "Spain")
SpainCombined <- transform(SpainCombined, Sp2012 = ifelse((SpainCombined$year == "2012" & SpainCombined$response == "atheist"), 1, 0))
SpainCombined <- transform(SpainCombined, Sp2005 = ifelse((SpainCombined$year == "2005" & SpainCombined$response == "atheist"), 1, 0))

SpainMean2005 <- nrow(subset(Spain2005, Spain2005$response == "atheist")) / nrow(Spain2005)
print(SpainMean2005)
SpainMean2012 <- nrow(subset(Spain2012, Spain2012$response == "atheist")) / nrow(Spain2012)
print(SpainMean2012)
t.test(SpainCombined$Sp2012 ~ SpainCombined$Sp2005, data = SpainCombined)

#### Exercise 11b: 
US2012 <- subset(atheism, atheism$nationality == "United States" & atheism$year == "2012")
inference(US2012$response, est = "proportion", type = "ci", method = "theoretical",
          success = "atheist")

US2005 <- subset(atheism, atheism$nationality == "Spain" & atheism$year == "2005")
inference(US2005$response, est = "proportion", type = "ci", method = "theoretical",
          success = "atheist")


#### Exercise 12:

#### Exercise 13: