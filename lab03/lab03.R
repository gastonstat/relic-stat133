# =====================================================
# Stat133: Lab 3
# Author: Gaston Sanchez
# Description: Reading data tables
# =====================================================


# =====================================================
# Data: Create your own data set
# =====================================================
# Open your text editor and create a small data table
# Use blank space as field separator: " "
# Save the data as "states.txt"
# For instance:
#   state initial capital area
#   "California" CA Sacramento 163707
#   "New York" NY Albany 54475
#   "Texas" TX Austin 268601
#   "North Carolina" NC Raleigh NA

# read the data 'states.txt' in R using read.table()
states <- read.table(file = "states.txt", header = TRUE)

# inspect states using the following functions:
str(states)
states
dim(states)
summary(states)



# =====================================================
# Data: "Body Mass of Late Quarternary Mammals"
# =====================================================
# Source: http://www.esapubs.org/archive/ecol/E084/094/default.htm
# Reference: 
#   Smith, F. A., et al. (2003)
#   Body mass of late Quaternary mammals.
#   Ecology 84:3403.
# URL: http://www.esapubs.org/archive/ecol/E084/094/MOMv3.3.txt

# Go to the URL of the data
# What's the field delimiter?
# Is there a column header?
# What value is used to indicate missing data?
# How would you import the data in file "MOMv3.3.txt"?

# Here's one option to read the data in R
url <- "http://www.esapubs.org/archive/ecol/E084/094/MOMv3.3.txt"
df <- read.table(file = url, header = FALSE, 
                 sep = "\t", na.strings = -999)

# Instead of read.table() what other function could you use?
df <- read.delim(file = url, na.strings = -999)

# inspect df using the following functions:
str(df)
dim(df)
nrow(df)
ncol(df)
head(df)
tail(df)
summary(df)


# Check the metadata at:
# http://www.esapubs.org/archive/ecol/E084/094/metadata.htm
# Look for the variable definitions:
#   Continent
#   Status
#   Order
#   Family
#   Genus
#   Species
#   LogMass
#   CombinedMass
#   Reference

# Read the data again but just the first 100 rows
# Use the argument col.names to provide a vector of column names
df_names <- c('continent', 'status', 'order', 'family', 'genus',
              'species', 'logmass', 'combmass', 'reference')

df2 <- read.delim(file = url, na.strings = -999, 
                 nrows = 100, col.names = df_names)

str(df2, vec.len = 1)
head(df2)
summary(df2)


# Remove the column 'reference'
df2$reference <- NULL

# create a new variable 'log2mass' (log base 2 of combmass)
df2$log2mass <- log(df2$combmass)



# =====================================================
# Data: "Brac 2006 - fish data"
# =====================================================
# Source: http://datadryad.org/handle/10255/dryad.34126
# Reference: 
#   Sizling et al. (2011)
#   Between geometry and biology: the problem of universality 
#   of the species-area relationship.
#   The American Naturalist 178(5): 602-611.
# URL: http://datadryad.org/bitstream/handle/10255/dryad.34127/Brac%202006%20-%20fish%20data.txt?sequence=1

# Go to the URL of the data
# What's the field delimiter?
# Is there a column header?
# Are there any lines to be skipped?
# How would you import the data in file "Brac 2006 - fish data"?

fish_url <- "http://datadryad.org/bitstream/handle/10255/dryad.34127/Brac%202006%20-%20fish%20data.txt?sequence=1"
fish <- read.table(fish_url, header = TRUE, sep="\t", skip = 1)

# inspect df using the following functions:
str(fish)
dim(fish)
nrow(fish)
ncol(fish)
head(fish)
tail(fish)
summary(fish)



# =====================================================
# Data: SF Open Data "Permit Types"
# =====================================================
# Source: https://data.sfgov.org/City-Infrastructure/Permit-Types/6wa6-8527
# Reference: 
#   SF Open Data
# URL: https://data.sfgov.org/City-Infrastructure/Permit-Types/6wa6-8527

# Go to the link of the data
# The data "Permit Types" can be downloaded in several ways
# Click the "Export" button in the menu bar to see those options
# The goal is to read the data in CSV format
permits_url <- "https://data.sfgov.org/api/views/6wa6-8527/rows.csv"

# try to use read.csv() and see what happens
permits <- read.csv(permits_url)

# the problem has to do with the Secured HTTP url (i.e. "https://...")
# read.csv() cannot handle 'https'


# OPTION 1
# One solution is to download the file to your computer
# and then use read.csv()
# Assuming that the downloaded file is in your working directory:
pt <- read.csv("Permit_Types.csv")


# OPTION 2
# Instead of downloading the file, we can read it directly in R
# One solution is to use the package RCurl
# (remember to install it first)
library(RCurl)

# URL of data file
perms_url <- getURL(permits_url)

# import data in R (through a text connection)
perms <- read.csv(textConnection(perms_url))

head(perms)


# OPTION 3 (my preferred one)
# Another solution is to use the package 'readr'
# (if you don't have it yet, remember to install it first)
library(readr)
permits <- read_csv(permits_url)
head(permits)

