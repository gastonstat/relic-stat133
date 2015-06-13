# =====================================================
# Stat133: HW 1
# Description: Basics of character vectors
# Data: Teams that played the superbowl
# =====================================================

# Please submit your own R script file to the shared Dropbox folder
# If you don't have access to such folder, contact the instructor

# Write your name
# Name:


# Start a new R session and load the data
load(url("http://gastonsanchez.com/teaching/stat133/superbowl_teams.RData"))

# "superbowl_teams.RData" contains 3 vectors:
# year: year of superbowl from 1967 to 2015
# winner: champions
# loser: losing teams

# find the class of each vector (year, winner, loser)



# use length() to determine whether the three vectors
# have the same number of elements




# =====================================================
# Winning teams
# Write the commands to answer the following questions
# =====================================================

# get the first 5 champions



# get the last 5 champions


# how many unique champions?


# use the function table() to get a 
# table of frequencies for the winning teams
# (assign the table to the object 'win_freqs')


# what team has won the superbowl most times?
# and how many times?



# apply table() on 'win_freqs', this will give you
# how many teams have won how many superbowls



# create a vector 'champions' by sorting the frequencies
# 'win_freqs' in decreasing order


# make a barplot of 'champions' with barplot()


# try this command
barplot(champions, las = 2)

# try this other command
op <- par(mar = c(2, 11, 1, 2))
barplot(champions, horiz = TRUE, las = 2)
par(op)


# What are the championships of "San Francisco 49ers"


# What are the championships of "Oakland Raiders" 


# when was the last time Denver Broncos won a superbowl?




# create 'winner2', a copy of the vector 'winner'


# replace some team names in 'winner2' as follows:
# "New York Giants" to "NYG"
# "New York Jets" to "NYJ"
# "Kansas City Chiefs" to "KCC"




# =====================================================
# Losing team
# Write the commands to answer the following questions
# =====================================================

# get the losing teams of the first 5 superbowls



# get the losing teams of the last 5 superbowls


# create the frequency table 'los_freqs'
# of losing teams


# What is the team that have lost the superbowl
# the most times?, and how many times?




# =====================================================
# Winners and Losers
# Write the commands to answer the following questions
# =====================================================

# how many different teams have played the superbowl?


# teams that have played the superbowl and have never lost


# teams that have played the superbowl and have never won


# teams that have played the superbowl (both won and lost)?


# how many teams have both won and lost the superbowl?



# what team won the superbowl in 2000


# what team lost the superbowl in 2000


# what teams won the superbowl in the 1970s (1970-1979)


# what teams lost the superbowl in the 1990s (1990-1999)


# create a data frame 'superbowl' with the three vectors:
# year, winner, loser


