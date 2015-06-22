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


# inspect the data structure of 'tents'


# how many rows in the dataset?


# how many columns in the dataset?


# names of columns


# take a look at the first 6 rows



# =====================================================
# Quantitative Variables:
# =====================================================
# We'll start by exploring the quantiative variables
# 1) price
# 2) weight
# 3) height
# =====================================================

# get numeric summaries of each quantitative variable



# weight is given in grams
# add a new variable to 'tents' for weight expressed in pounds


# height is given in centimeters
# add a new variable to 'tents' for height expressed in inches


# how many tents have price less than $300


# how many tents have price greater than $400


# what's the name of the tent with maximum price


# what's the name of the tent with minimum price


# what's the name of the tent with maximum weight


# what's the name of the tent with minimum weight


# select the data of tents with 
# price > $400 AND weight < 1500 grams


# subset those tents with brand 'big-agnes'



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




# Obtain scatter plots of:
# price, height
# price, weight
# height, weight



# Obtain a scatter plot matrix of price, height, and weight



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



# what is the brand with less number of tents


# are there any tents of brand 'rei'?
# and if so, how many?



# are there any tents of brand 'millet'
# and if so, how many?


# how many 'north-face' tents are intended to be
# used ('bestuse') for Mountaineering


# what brands have tents intended to be used for 'Mountaineering'



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





# =====================================================
# More basic manipulations
# =====================================================

# summary of 'price' of big agnes tents


# summary of 'price' of rei tents


# cross-table of seasons and bestuse






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




# make a scatter-plot of height and weight, using 
# 'capacity' as a factor for the color argument


# get the same scatter plot but now pass 'bestuse'
# as a factor for the color argument


# remember that factors are internally stored as
# integer vectors. To get the integers associated to the 
# levels of a factor you can use unclass(). For instance:
unclass(factor(tents$bestuse))

# make the same scatter plot, using 'bestuse' as factor for colors,
# and using the integers associated to factor 'bestuse' for the
# argument that changes the type of plotted symbol




# =====================================================
# Plot challenge: 
# =====================================================

# obtain a new data frame by subsetting tents of brand 'rei'


# create a vector of colors for each rei tent according to 'bestuse':
# 'Carcamping' tents in color 'tomato'
# 'Backpacking' tents in color 'orange'
# 'Mountaineering' tents in color 'blue'




# Make a scatter plot of 'height' and 'weight' (of 'rei' tents)
# The background of the entire plot must be of color 'gray99'
# Instead of points, show the name of each rei tent
# Use the vector of colors to color tent names
# Include a legend in the top left corner indicating the 
# 'bestuse' types and their corresponding colors
# Add a title

