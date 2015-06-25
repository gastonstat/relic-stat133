# =====================================================
# Stat133: Lab 2
# Description: Basics of data frames
# Data: Star Wars characters
# =====================================================

# To read the data, we'll use the package "readr"
# To install "readr" type:
install.packages("readr")

# Remember that you only need to install a package once

# load "readr
library("readr")

# read data using read_csv()
# (read_csv() does not convert strings into factors)
sw <- read_csv("https://raw.githubusercontent.com/gastonstat/stat133/master/datasets/starwarstoy.csv")


# use str() to get information about the data frame structure
str(sw)

# use summary() to get some descriptive statistics
summary(sw)

# convert column 'gender' as a factor
sw$gender <- factor(sw$gender)

# apply summary() on gender
summary(sw$gender)

# apply table() on gender
table(sw$gender)

# what's the largest height value
max(sw$height)

# what's the minimum height value
min(sw$height)

# what's the average height
mean(sw$height)

# who has of smallest height
sw$name[which.min(sw$height)]

# who has of largest height
sw$name[which.max(sw$height)]

# sort height
sort(sw$height)

# sort weight in decrasing order
sort(sw$weight, decreasing = TRUE)

# are there any subjects with weapon knife
any(sw$weapon == 'weapon')

# are there any subjects with height > 2 meters
any(sw$height > 2)

# are there any subjects with height < 0.5 meters
# or weight < 50 kg
any(sw$height < 0.5 | sw$weight < 50)

# what are the unique weapons
unique(sw$weapon)

# how many different species
length(unique(sw$species))


# =====================================================
# Subsetting operations (without using subset())
# =====================================================

# first row
sw[1, ]

# Han Solo's info
sw[sw$name == "Han Solo", ]

# subject's info of smallest height
sw[which.min(sw$height), ]

# male subjects
sw[sw$gender == "male", ]

# less than 1.7 m height
sw[sw$height < 1.7, ]

# less than 1.7 m height, and less than 50 g weight
sw[sw$height < 1.7 & sw$weight < 50, ]

# select data of droids or humans
sw[sw$species == 'droid' | sw$species == 'human', ]

# select data of non-humans
sw[sw$species != 'human', ]


# =====================================================
# Subsetting operations using subset()
# =====================================================

# Han Solo's info
subset(sw, name == "Han Solo")

# subject's info of smallest height
subset(sw, height == min(height))

# male subjects
subset(sw, gender == "male")

# less than 1.7 m height
subset(sw, height < 1.7)

# less than 1.7 m height, and less than 50 g weight
subset(sw, height < 1.7 & weight < 50)

# select data of droids or humans
subset(sw, species == 'droid' | species == 'human')

# select data of non-humans
subset(sw, species != 'human')


# =====================================================
# Sorting operations
# =====================================================

# sort data by height
sw[order(sw$height), ]

# sort data by weight in decreasing order
sw[order(sw$weight, decreasing = TRUE), ]

# sort data by gender
sw[order(sw$gender), ]

# sort data by species
sw[order(sw$species), ]


# =====================================================
# Additional questions
# =====================================================

# information of jedis
sw[sw$jedi == "jedi", ]

# names of non-jedis
sw$name[sw$jedi == "jedi"]

# information of non humans
sw[sw$species == "human", ]

# get the data of those above the average weight?
subset(sw, weight > mean(weight))

# how many unarmed humans?
sum(sw$weapon == "unarmed")

# standard deviation of weight in non-humans 
sd(sw$weight[sw$species != "human"])

# which humans use a lightsaber
subset(sw, species == "human" & weapon == "lightsaber")

# median height of unarmed non-humans
median(sw$weight[sw$species != 'humans' & sw$weapon == 'unarmed'])

# get the square weight of non-jedis
sw$weight[sw$jedi == 'no_jedi']^2

# get the log of height for subjects
# with blaster or bowcaster weapons
log(sw$height[sw$weapon %in% c("blaster", "bowcaster")])
log(sw$height[sw$weapon == "blaster" | sw$weapon == "bowcaster"])

# use plot() to make a scatter plot of height and weight
plot(sw$height, sw$weight)

# create a new variable "newvar": height divided by weight
newvar <- sw$height / sw$weight

# add 'newvar' to the data frame sw
sw$newvar <- newvar
