# =====================================================
# Stat133: HW 2
# Description: Basic manipulation of data structures
#              and creation of simple graphics
# Data: Camping Tents
# =====================================================

# Please submit your own R script file to bcourses

# Write your name
# Name:


# =====================================================
# Reading the Data Into R
# =====================================================
# We'll be working with the dataset 'tents1.csv'
# (available in the folder 'datasets' in the 
# github repository of the course)
# =====================================================

# read the file 'tents1.csv' in R and assign it to an object
# called 'tents' ---this will be the main data frame--- 
# Character strings must NOT be converted to factors!
# (use whatever method you like to import the data)
setwd("/Users/Gaston/Documents/stat133/stat133")
tents <- read.csv("datasets/tents1.csv", stringsAsFactors = FALSE)

# inspect the data structure of 'tents'
str(tents, vec.len = 1)

# how many rows in the dataset?
nrow(tents)

# how many columns in the dataset?
ncol(tents)

# names of columns
names(tents)

# take a look at the first 6 rows
head(tents)


# =====================================================
# Quantitative Variables:
# =====================================================
# We'll start by exploring the quantiative variables
# 1) price
# 2) weight
# 3) height
# =====================================================

# get numeric summaries of each quantitative variable
summary(tents$price)
summary(tents$weight)
summary(tents$height)

# weight is given in grams
# add a new variable to 'tents' for weight expressed in pounds
tents$weight_lbs <- tents$weight * 0.0022

# height is given in centimeters
# add a new variable to 'tents' for height expressed in inches
tents$height_in <- tents$height * 0.3937

# how many tents have price less than $300
sum(tents$price < 300)

# how many tents have price greater than $400
sum(tents$price > 400)

# what's the name of the tent with maximum price
tents$name[which.max(tents$price)]

# what's the name of the tent with minimum price
tents$name[which.min(tents$price)]

# what's the name of the tent with maximum weight
tents$name[which.max(tents$weight)]

# what's the name of the tent with minimum weight
tents$name[which.min(tents$weight)]

# select the data of tents with 
# price > $400 AND weight < 1500 grams
tents[tents$price > 400 & tents$weight < 1500, ]

# subset those tents with brand 'big-agnes'
big_agnes <- subset(tents, brand == 'big-agnes')
head(big_agnes)

# Create a factor of prices using the cut() function;
# for the argument 'breaks' give a vector of cutting points
# such that the obtained levels are as follows:
#    (0, 100]
#  (100, 200]
#  (200, 300]
#  (300, 400]
#  (400, 500]
#  (500, 600]
#  (600, 700]
price_cut <- cut(
  tents$price, 
  breaks = c(0, 100, 200, 300, 400, 500, 600, 700)
)

table(price_cut)


# =====================================================
# Statistical graphics of Quantitative Variables
# =====================================================
# for each quantitative variable, obtain the following plots:
# - histogram
# - boxplot
# - density curve
# (look at each graphic carefully and see what types 
# of distribution patterns show each variable)
# =====================================================

hist(tents$price)
boxplot(tents$price)
plot(density(tents$price))

hist(tents$weight)
boxplot(tents$weight)
plot(density(tents$weight))

hist(tents$height)
boxplot(tents$height)
plot(density(tents$height))


# Obtain scatter plots of:
# price, height
# price, weight
# height, weight
plot(tents[ , c('price', 'height')])
plot(tents[ , c('price', 'weight')])
plot(tents[ , c('height', 'weight')])


# Obtain a scatter plot matrix of price, height, and weight
pairs(tents[ , c('price', 'height', 'weight')])


# =====================================================
# Plot challenge: 
# Here's a small graphic challenge; you'll need to 
# read the documentation of plot() and par()
# =====================================================
# Obtain a scatter plot of height and weight such that:
# - Axis are labeled with the corresponding variable name
# - Points are colored with alpha transparency
#   (choose a color of your preference)
# - The symbol of points are squares
# - x-axis ranges from 80 to 220
# - y-axis ranges from 0 to 10000
# - Include a title
plot(tents[ , c('height', 'weight')], xlim = c(80, 220),
     ylim = c(0, 10000), col = "#894588aa", pch = 15,
     main = "Height and Weight of Camping Tents")



# =====================================================
# Qualitative Variables
# =====================================================
# Now let's focus on the qualitative variables:
# 1) brand
# 2) bestuse
# 3) seasons
# 4) capacity
# =====================================================

# get frequency tables of each qualitative variable
table(tents$brand)
table(tents$bestuse)
table(tents$seasons)
table(tents$capacity)

# what is the brand with less number of tents
which.min(table(tents$brand))

# are there any tents of brand 'rei'?
# and if so, how many?
any(tents$brand == 'rei')
sum(tents$brand == 'rei')

# are there any tents of brand 'millet'
# and if so, how many?
any(tents$brand == 'millet')

# how many 'north-face' tents are intended to be
# used ('bestuse') for Mountaineering
sum(tents$bestuse[tents$brand == 'north-face'] == 'Mountaineering')

# what brands have tents intended to be used for 'Mountaineering'
tents$brand[tents$bestuse == "Mountaineering"]


# =====================================================
# Statistical graphics of Qualitative Variables
# =====================================================
# for 'bestuse', 'seasons', and 'capacity' obtain 
# the following plots:
# - bar plot
# - dot chart
# - pie chart
# (feel free to change colors, add titles, and rank values)
# =====================================================

tbestuse <- table(tents$bestuse)
barplot(tbestuse)
dotchart(tbestuse)
pie(tbestuse)

tseasons <- table(tents$seasons)
barplot(tseasons)
dotchart(tseasons)
pie(tseasons)

tcapacity <- table(tents$capacity)
barplot(tcapacity)
dotchart(tcapacity)
pie(tcapacity)


# =====================================================
# Plot challenge: 
# =====================================================
# Make a barplot for 'brand' such that:
# - bars are horizontally oriented
# - bars are arranged in decreasing order
# - bars without a border
# - brand labels are perpendicular to the y-axis
#   (i.e. labels horizontally oriented)
# - modify margins in order to have enough room for labels 
# - x-axis ranges from 0 to 25
# - include a title
tbrand <- sort(table(tents$brand), decreasing = FALSE)

op <- par(mar = c(4, 8, 3, 2))
barplot(tbrand, horiz = TRUE, border = NA, las = 2, xlim = c(0, 25))
title("Bar chart of Tent Brands")
par(op)



# =====================================================
# More basic manipulations
# =====================================================

# summary of 'price' of big agnes tents
summary(tents$price[tents$brand == 'big-agnes'])

# summary of 'price' of rei tents
summary(tents$price[tents$brand == 'rei'])

# cross-table of seasons and bestuse
table(tents$seasons, tents$bestuse)



# =====================================================
# Bivariate Plots
# =====================================================

# use boxplot() to plot the distribution of 'weight' 
# conditional to:
# - brand
# - bestuse
# - capacity
# - seasons
# (get a boxplot for each categorical variable)
boxplot(tents$weight ~ tents$brand)
boxplot(tents$weight ~ tents$bestuse)
boxplot(tents$weight ~ tents$capacity)
boxplot(tents$weight ~ tents$seasons)


# make a scatter-plot of height and weight, using 
# 'capacity' as a factor for the color argument
plot(tents$height, tents$weight, col = factor(tents$capacity))

# get the same scatter plot but now pass 'bestuse'
# as a factor for the color argument
plot(tents$height, tents$weight, col = factor(tents$bestuse))

# remember that factors are internally stored as
# integer vectors. To get the integers associated to the 
# levels of a factor you can use unclass(). For instance:
unclass(factor(tents$bestuse))

# make the same scatter plot, using 'bestuse' as factor for colors,
# and using the integers associated to factor 'bestuse' for the
# argument that changes the type of plotted symbol
plot(tents$height, tents$weight, 
     col = factor(tents$bestuse), 
     pch = unclass(factor(tents$bestuse)))



# =====================================================
# Plot challenge: 
# =====================================================

# obtain a new data frame by subsetting tents of brand 'rei'
rei <- subset(tents, brand == 'rei')

# create a vector of colors for each rei tent according to 'bestuse':
# 'Carcamping' tents in color 'tomato'
# 'Backpacking' tents in color 'orange'
# 'Mountaineering' tents in color 'blue'
rei_cols <- character(nrow(rei))
rei_cols[rei$bestuse == "Carcamping"] <- "tomato"
rei_cols[rei$bestuse == "Backpacking"] <- "orange"
rei_cols[rei$bestuse == "Mountaineering"] <- "blue"

# Make a scatter plot of 'height' and 'weight' (of 'rei' tents)
# The background of the entire plot must be of color 'gray99'
# Instead of points, show the name of each rei tent
# Use the vector of colors to color tent names
# Include a legend in the top left corner indicating the 
# 'bestuse' types and their corresponding colors
# Add a title
op <- par(bg = 'gray99')
plot(rei$height, rei$weight, type = 'n',
     xlab = "hieght", ylab = 'weight')
text(rei$height, rei$weight, labels = rei$name, 
     col = rei_cols)
legend("topleft", 
       legend = c('Carcamping', 'Backpacking', 'Mountaineering'),
       fill = c('tomato', 'orange', 'blue'))
title('REI tents')
par(op)


