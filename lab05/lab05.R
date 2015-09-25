# =====================================================
# Stat133: Lab 5
# Author: Gaston Sanchez
# Description: Introduction to 'ggplot2'
# Data: tents1.csv
# =====================================================

# =====================================================
# Data: tents1
# =====================================================
# We'll be working with the dataset 'tents1.csv'
# (available in the folder 'datasets' from the 
# github repository of the course)
# =====================================================

# load packages
library(readr)    # for reading data files
library(ggplot2)  # for plots

# read data
tents <- read_csv("https://raw.githubusercontent.com/gastonstat/stat133/master/datasets/tents1.csv")


# =====================================================
# Quantitative Variables:
# =====================================================
# We'll start with a visual exploration of the 
# quantiative variables
# 1) price
# 2) weight
# 3) height
# =====================================================

# Note that ggplot2 is mainly intended to produce graphics
# of more than one variable. If you want to get univariate
# charts, probably ggplot2 may not be the best option.

# default histogram
ggplot(data = tents, aes(x = price)) +
  geom_histogram()

# histogram changing binwidth
ggplot(data = tents, aes(x = price)) +
  geom_histogram(binwidth = 50)

# density curve of price
ggplot(data = tents, aes(x = price)) +
  geom_density()

# boxplots in ggplot2 are intended to work as 
# "conditional" boxplots
# (i.e a numeric vector in terms of a factor)
# A workwround to create a boxplot of one single 
# is as follows:
ggplot(data = tents, aes(x = 1, y = price)) +
  geom_boxplot()

# Here's how boxplots are best used in ggplot2
# Boxplot of price conditional on bestuse
ggplot(tents, aes(x = bestuse, y = price)) + 
  geom_boxplot()

# boxplot of price in terms of capacity
ggplot(tents, aes(x = capacity, y = price)) + 
  geom_boxplot()


# Your Turn!
# Try generating histograms, density curves, 
# and boxplots for either 'height' or 'weight'





# =====================================================
# Qualitative Variables:
# =====================================================
# Now let's explore some qualiative variables
# 1) brand
# 2) capacity
# =====================================================

# bar chart of brand
ggplot(tents, aes(x = brand)) + 
  geom_bar()

# bar chart of capacity
ggplot(tents, aes(x = capacity)) + 
  geom_bar()

# colored bar chart of brand
ggplot(tents, aes(x = brand, fill = brand)) + 
  geom_bar()


# Your Turn!
# Try generating barcharts for 'bestuse' and seasons


## generate a barchart for bestuse colored by brand



# =====================================================
# Graphics with two or more variables
# ggplot2 excels at plotting with 2 or more variables
# =====================================================

# boxplot of weight by brand (with fill color by brand)
ggplot(tents, aes(x = brand, y = weight, fill = brand)) +
  geom_boxplot()

# boxplot of weight by capacity (with fill color by capacity)
ggplot(tents, aes(x = capacity, y = weight, fill = capacity)) +
  geom_boxplot() 

# densities of weight by bestuse (with fill color by bestuse)
ggplot(tents, aes(x = weight, group = bestuse)) +
  geom_density(aes(fill = bestuse), alpha = 0.7) 

### Your turn!
## densities of height by capacity (with fill color by capacity)


##boxplot of height by capacity (with fill color by bestuse)


# =====================================================
# Graphics with 'ggplot2'
# Scatter plots
# =====================================================

# Create a ggplot object that will serve as the 
# basis for a scatter-plot of height and weight
hw <- ggplot(tents, aes(x = height, y = weight)) +
  ggtitle("Tents: relation between height and weight")


# Let's use 'hw' and add points
hw + geom_point()


# Get a scatter plot of height and weight
# price mapped to size of points
hw + geom_point(aes(size = price))


# get a scatter plot of height and weight
# price mapped to size of points
# bestuse mapped to color of points
hw + geom_point(aes(size = price, color = bestuse))


# get a scatter plot of height and weight
# price mapped to size of points
# bestuse mapped to color of points
# seasons mapped to shape of points
hw + geom_point(aes(size = price, 
                    color = bestuse,
                    shape = seasons))


# =====================================================
# Faceting
# =====================================================
# scatter plot of weight -vs- height 
# coloring by bestuse and
# faceting by capacity
# =====================================================

# faceting by columns
hw + geom_point(aes(color = bestuse),
                size = 4, alpha = 0.7) + 
  facet_grid(~ capacity)

# faceting by rows
hw + geom_point(aes(color = bestuse),
                size = 4, alpha = 0.7) + 
  facet_grid(capacity ~ .)

# wrap by rows and columns
hw + geom_point(aes(color = bestuse),
                size = 4, alpha = 0.7) + 
  facet_wrap(~ capacity)




# =====================================================
# Modifying scales and theme elements
# =====================================================
# Look at the documentation for scales and themes
# http://docs.ggplot2.org/0.9.3.1/scale_manual.html
# http://docs.ggplot2.org/0.9.2.1/theme.html
# =====================================================

# changing shape symbols
hw + geom_point(aes(shape = seasons)) +
  scale_shape_manual(values = c(2, 4, 6))


# changing theme elements
hw + geom_point() +
  theme(plot.background = element_rect(fill = "#ebf248"))


# changing shape and color of symbols,
# as well as backgrounds
hw + geom_point(aes(size = price, 
                    shape = seasons, 
                    color = bestuse)) +
  scale_shape_manual(values = c(15, 17, 20)) +
  scale_color_manual(values = c('#ebf248', '#96f248', '#f2a448')) +
  theme(panel.background = element_rect(fill = 'gray20'),
        plot.background = element_rect(fill = "#ebf248"))

