install.packages("knitr")
library(knitr)
install.packages(('rmarkdown'))

 <!-- Instructions: This is the template you will use to type up your responses to the exercises and the on your own questions. To produce a document that you can print out and turn in just click on Knit HTML above. All you need to do to complete the lab is to type up your BRIEF answers and the R code (when necessary) in the spaces provided below. If you want to find out more about the markdown language click on the MD icon. -->
  
  ---
  ### title: Lab0
  
  ### author: 'Jonah Tuckman'
  --- 
  ### Discussants (other team members present in lab):[Enter discussant names here]
  
  
  #### Load Arbuthnot's data:

source("http://www.openintro.org/stat/data/arbuthnot.R")



#### Exercise 1: 


```{r}
# code for Exercise 1 is already entered below as an example
arbuthnot$girls
#plot(arbuthnot$girls)
plot(x = arbuthnot$year, y = arbuthnot$girls, type = "b")
```

#### Exercise 2:
## Is there an apparent trend in the # girls baptized?
# Yes, they gradually fell in the mid 1600s then grew rapidly after 1660.

totalBap = arbuthnot$boys + arbuthnot$girls
plot(arbuthnot$year, totalBap, type = 'b')

Proportion =  arbuthnot$boys / arbuthnot$girls
newBornBoys = arbuthnot$boys/(totalBap)

#### Exercise 3:
```{r fig.width=7, fig.height=5}
plot(arbuthnot$year, newBornBoys, type = 'b')
# This is a very volitile graph showing the proportion of boys over time
# The boys bounce around the line of about 51% meaning they generally stay at that portion 
# of the population 

```



arbuthnot$boys > arbuthnot$girls # True every single year


#### Load present day data:
```{r}
source("http://www.openintro.org/stat/data/present.R")
```

#### Exercise 4:

present
dim(present) 
# 1940 - 2002
# 63 rows, 3 columns
# year, boys, girls

#### Exercise 5:

arbuthnot

present
# There are less years looked at in this dataset of present day.
# Every year there are far more baptizims for both boys and girls 
# The scale is not close, the max of the present is 2186274, the max of 
# the arb dataset was 8426.
max(present)
max(arbuthnot)

#### Exercise 6:



```{r fig.width=7, fig.height=5}
boyToGirl = present$boys / present$girls
plot(present$year, boyToGirl, type ='b')
# The ratio of boys to girls being baptized is falling to be closer to 1 to 1 over time.
# Boys are still in greater proportion than girls but this trend is now downard sloping and approaching equality.

```



#### Exercise 7:

```{r present}
max(present)
present
# This max of 2186274 was achieved in 1961 by boys
```


