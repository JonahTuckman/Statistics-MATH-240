download.file("http://www.openintro.org/stat/data/bdims.RData", destfile = "bdims.RData")
load("bdims.RData") ## bdims

qqnorm(bdims$hgt)
qqline(bdims$hgt)


# (a) The histogram for female biiliac (pelvic) diameter (bii.di) belongs to normal probability plot
# letter B.
# (b) The histogram for female elbow diameter (elb.di) belongs to normal probability plot letter C.
# (c) The histogram for general age (age) belongs to normal probability plot letter D.
# (d) The histogram for female chest depth (che.de) belongs to normal probability plot letter A.


# Bii.di
meanA = mean(bdims$bii.di)
sdA = sd(bdims$bii.di, na.rm = FALSE)
adjustedA = ((bdims$bii.di - meanA) / sdA)
hist(adjustedA, main = "BII.DI")

qqnorm(adjustedA, main = "BII.DI")
qqline(adjustedA) ## Belongs to probability plot B

# Elb.di
meanB = mean(bdims$elb.di)
sdB = sd(bdims$elb.di)
adjustedB = ((bdims$elb.di - meanB) / sdB)
hist(adjustedB, main = "ELB.DI")

qqnorm(adjustedB, main = "ELB.DI")
qqline(adjustedB) ## Belongs to probability plot C

# Age
meanC = mean(bdims$age)
sdC = sd(bdims$age)
adjustedC = ((bdims$age - meanC) / sdC)
hist(adjustedC, main = "Age")

qqnorm(adjustedC, main = "Age")
qqline(adjustedC) ## Belongs to probability plot D

#Che.de
meanD = mean(bdims$che.de)
sdD = sd(bdims$che.de)
adjustedD = ((bdims$che.de - meanD) - sdD)
hist(adjustedD,  main = "CHE.DE")

qqnorm(adjustedD, main = "CHE.DE")
qqline(adjustedD) ## Belonds to probability plot A

