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

#### Exercise 11a: 

#### Exercise 11b: 

#### Exercise 12:

#### Exercise 13: