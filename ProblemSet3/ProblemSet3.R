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

hist((bdims$bii.di - meanA) / sdA)



qqnorm(bdims$bii.di)
qqline(bdims$bii.di) ## Belongs to probability plot B

# Elb.di
meanB = mean(bdims$elb.di)
sdB = sd(bdims$elb.di)
hist((bdims$elb.di - meanB) / sdB)

qqnorm(bdims$elb.di)
qqline(bdims$elb.di) ## Belongs to probability plot C

# Age
meanC = mean(bdims$age)
sdC = sd(bdims$age)
hist((bdims$age - meanC) / sdC)

qqnorm(bdims$age)
qqline(bdims$age) ## Belongs to probability plot D

#Che.de
meanD = mean(bdims$che.de)
sdD = sd(bdims$che.de)
hist((bdims$che.de - meanD) - sdD)

qqnorm(bdims$che.de)
qqline(bdims$che.de) ## Belonds to probability plot A

