# =====================================================
# Stat133: HW 1
# Description: Basics of character vectors
# Data: Teams that played the superbowl
# =====================================================

# Please submit your own R script file to the shared Dropbox folder
# If you don't have access to such folder, contact the instructor

# Write your name
# Name:

# load the package "ggplot2"
library(ggplot2)

setwd("/Users/Gaston/Documents/stat133/stat133")
tents <- read.csv("datasets/tents.csv")

# inspect the data structure with str()
str(tents, vec.len = 1)

# how many rows in the dataset?
nrow(tents)

# how many columns in the dataset?
ncol(tents)

# names of columns
names(tents)


# =====================================================
# Practice some basic manipulations
# =====================================================

# table of brands
table(tents$brand)

# summary of 'price' of big agnes tents
summary(tents$price[tents$brand == 'big-agnes'])

# summary of 'price' of rei tents
summary(tents$price[tents$brand == 'rei'])

# frequency of best use
table(tents$bestuse)

# which brands have tents 'bestuse' for Mountaineering
tents$brand[tents$bestuse == "Mountaineering"]

# inspect seasons
table(tents$seasons)

# inspect doors
table(tents$doors)

# table
table(tents$doors, tents$bestuse)

# table
table(tents$seasons, tents$bestuse)



boxplot(tents$weight ~ tents$brand)
boxplot(tents$weight ~ tents$doors)
boxplot(tents$weight ~ tents$bestuse)

boxplot(tents$price ~ tents$brand)
boxplot(tents$price ~ tents$doors)
boxplot(tents$price ~ tents$bestuse)
boxplot(tents$price ~ tents$seasons)

# =====================================================
# Graphics with 'ggplot2'
# =====================================================

ggplot(tents, aes(brand, price)) + 
  geom_boxplot()

ggplot(tents, aes(bestuse, price)) + 
  geom_boxplot()

ggplot(tents, aes(doors, price)) + 
  geom_boxplot()

ggplot(tents, aes(seasons, price)) + 
  geom_boxplot()


# =====================================================
# Graphics with 'ggplot2'
# =====================================================

ggplot(tents, aes(x = brand, y = weight)) +
  geom_boxplot()

ggplot(tents, aes(x = brand, y = weight, fill = brand)) +
  geom_boxplot()

ggplot(tents, aes(x = brand, y = weight, fill = brand)) +
  geom_boxplot() + 
  geom_jitter()

# weight by capacity
ggplot(tents, aes(x = capacity, y = weight, fill = capacity)) +
  geom_boxplot() 

# weight by bestuse
ggplot(tents, aes(x = bestuse, y = weight, fill = bestuse)) +
  geom_boxplot() 

# weight and height
ggplot(tents, aes(x = weight, y = height)) + 
  geom_point(aes(color = brand))

ggplot(tents, aes(x = weight, y = height)) + 
  geom_point(aes(color = bestuse))

ggplot(tents, aes(x = weight, y = height)) + 
  geom_point(aes(color = bestuse, size = price))

ggplot(tents, aes(x = weight, y = height)) + 
  geom_point(aes(color = bestuse, size = capacity),
             alpha = 0.7)

# faceting
# weight -vs- height by capacity (with bestuse)
ggplot(tents, aes(x = weight, y = height)) + 
  geom_point(aes(color = bestuse),
             size = 4, alpha = 0.7) + 
  facet_wrap(~ capacity)



# subset of brands
tb <- subset(tents, 
             brand %in% c('the-north-face', 'marmot', 'msr'))

ggplot(tb, aes(x = weight, fill = brand)) + 
  geom_density(alpha = 0.5)



