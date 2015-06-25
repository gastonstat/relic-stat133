# =====================================================
# Stat133: Lab 4
# Author: Gaston Sanchez
# Description: Basic Graphics
# Data: liga2015.csv
# =====================================================

# =====================================================
# Data: liga2015
# =====================================================
# For this session we'll be using the dataset that 
# comes in the file 'liga2015.csv' (see github repo)
# This dataset contains basic statistics from the
# Spanish soccer league during the season 2014-2015

# Read the data 
library(readr)
sc <- read_csv("https://raw.githubusercontent.com/gastonstat/stat133/master/datasets/liga2015.csv")

# Let's start with the rutinary inspection
# Check the data structure with str()
str(sc)

# how many rows in the dataset?
nrow(sc)

# how many columns in the dataset?
ncol(sc)

# names of columns
names(sc)


# =====================================================
# Let's start exploring 'wins'
# =====================================================

# apply summary() on wins
summary(sc$wins)

# boxplot of 'wins'
boxplot(sc$wins, main = "Boxplot: Wins")

# horizontal boxplot of 'wins'
boxplot(sc$wins, horizontal = TRUE, main = "Boxplot: Wins")

# histogram
hist(sc$wins)
# add some color
hist(sc$wins, col = 'gray90')

# kernel density curve
plot(density(sc$wins))

# in order to color the area under the curve you
# need to use polygon()
density_wins <- density(sc$wins)
plot(density_wins)
polygon(density_wins, col = '#3088f0', border = '#3088f0')

# dot-chart of wins
dotchart(sc$wins)

# dot-chart of wins with team labels
dotchart(sc$wins, labels = sc$team)

# ranked dot-chart of wins with team labels
dotchart(sort(sc$wins), labels = sc$team[order(sc$wins)])

# same ranked dot-chart of wins with team labels,
# with colored dots in 'blue'
dotchart(sort(sc$wins), labels = sc$team[order(sc$wins)], 
         bg = "blue")

# same ranked dot-chart with a title
dotchart(sort(sc$wins), labels = sc$team[order(sc$wins)], 
         bg = "blue", main = "Number of Wins")


# =====================================================
# Your turn:
# Get similar plots for 'losses' and 'draws'
# =====================================================

# boxplot of 'losses'


# horizontal boxplot of 'losses'



# histogram with some color


# kernel density curve


# in order to color the area under the curve you
# need to use polygon()




# dot-chart of losses


# dot-chart of losses with team labels


# ranked dot-chart of losses with team labels


# same ranked dot-chart of losses with team labels,
# with colored dots in 'blue'


# same ranked dot-chart with a title




# =====================================================
# Bivariate plots
# =====================================================

# scatterplot of 'wins' and 'losses'
plot(sc$wins, sc$losses)

# scatterplot of 'wins' and 'losses'
# with text labels
plot(sc$wins, sc$losses)
text(sc$wins, sc$losses, labels = sc$team)

# a nicer scatter-plot with 
# text labels to the right of each dot symbol
plot(sc$wins, sc$losses, xlim = c(0, 35), pch = 19,
     xlab = 'Wins', ylab = 'Losses',
     main = 'Number of Wins -vs- Number of Losses')
text(sc$wins, sc$losses, labels = sc$team, pos = 4)


# boxplots of wins and losses
boxplot(sc[ , c('wins', 'losses')])


# =====================================================
# Your turn:
# Get similar plots for 'wins' and 'draws'
# Get similar plots for 'losses' and 'draws'
# =====================================================




# =====================================================
# Exploring 'wins', 'draws' and 'losses'
# =====================================================

# scatterplot matrix with 'wins', 'draws', and 'losses'
pairs(sc[ , 3:5])

# boxplots of wins and losses
boxplot(sc[ , c('wins', 'draws', 'losses')])

# some scatterplot in 3d
library(scatterplot3d)
scatterplot3d(sc[ , c('wins', 'draws', 'losses')])

scatterplot3d(sc[ , c('wins', 'draws', 'losses')], 
              color = "blue", pch = 19)



# =====================================================
# Plots from scratch
# =====================================================
# We can create charts using only 
# low-level plotting functions
# =====================================================

# here's a default scatter plot
plot(sc$wins, sc$goals_for)

# Now let's get a better scatter plot without plot()
# open plot frame
plot.new()
# define coordinates
plot.window(xlim = c(0, 35), ylim = c(20, 120), xaxs='i')
# add x-axis
axis(side = 1, at = seq(0, 35, by = 5))
mtext('Wins', side = 1, line = 2.5)
# add y-axis
axis(side = 2, at = seq(20, 120, by = 20), las = 2)
mtext('Goals For', side = 2, line = 2.5)
# points
points(sc$wins, sc$goals_for, pch = 19, col = '#8da4dc',
       cex = 1.2)
# labels
text(sc$wins, sc$goals_for, labels = abbreviate(sc$team), 
     col = '#555555aa', cex = 0.9, pos = 4)
# title
title('Wins -vs- Goals-For', col.main = 'gray30')

