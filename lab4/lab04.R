# =====================================================
# Stat133: Lab 4
# Author: Gaston Sanchez
# Description: Basic Graphics
# =====================================================


setwd("/Users/Gaston/Documents/stat133/stat133")
sc <- read.csv("datasets/liga2015.csv")

# inspect the data structure with str()
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
boxplot(sc$wins)

# horizontal boxplot of 'wins'
boxplot(sc$wins, horizontal = TRUE)

# horizontal boxplot of 'wins'
boxplot(sc$wins, horizontal = TRUE, 
        main = "Box Plot of Number of Wins")

# histogram, and density curve of 'wins'
hist(sc$wins)
plot(density(sc$wins))

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
# Get similar plots for 'draws' and 'losses'
# =====================================================



# =====================================================
# Bivariate plots
# =====================================================

# scatterplot of 'wins' and 'losses'
plot(sc$wins, sc$losses)

# scatterplot of 'wins' and 'losses'
# with text labels
plot(sc$wins, sc$losses)
text(sc$wins, sc$losses, labels = sc$team)

# a nicer scatter-plot
# with text labels
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
