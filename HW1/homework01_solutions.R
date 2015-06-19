# =====================================================
# Stat133: HW 1
# Description: Basics of character vectors
# Data: Teams that played the superbowl
# =====================================================

# Start a new R session and load the data
load(url("http://gastonsanchez.com/teaching/stat133/superbowl_teams.RData"))

# "superbowl_teams.RData" contains 3 vectors:
# year: year of superbowl form 1967 to 2015
# winner: champions
# loser: losing teams

# find the class of each vector (year, winner, loser)
class(year)
class(winner)
class(loser)

# use length() to determine whether the three vectors
# have the same number of elements
length(year)
length(winner)
length(loser)


# =====================================================
# Winning teams
# Write the commands to answer the following questions
# =====================================================

# get the first 5 champions
winner[1:5]
head(winner, n = 5)

# get the last 5 champions
tail(winner, n = 5)

# how many unique champions?
unique(winner)

# use the function table() to get a 
# table of frequencies for the winning teams
# (assign the table to the object 'win_freqs')
win_freqs <- table(winner)

# what team has won the superbowl most times?
# and how many times?
which.max(win_freqs)
win_freqs[which.max(win_freqs)]

# apply table() on 'win_freqs', this will give you
# how many teams have won how many superbowls
table(win_freqs)


# create a vector 'champions' by sorting the frequencies
# 'win_freqs' in decreasing order
champions <- sort(win_freqs, decreasing = TRUE)

# make a barplot of 'champions' with barplot()
barplot(champions)

# try this command
barplot(champions, las = 2)

# try this other command
op <- par(mar = c(2, 11, 1, 2))
barplot(champions, horiz = TRUE, las = 2)
par(op)


# What are the championships of "San Francisco 49ers"
year[winner == "San Francisco 49ers"]

# What are the championships of "Oakland Raiders" 
year[winner == "Oakland Raiders"]

# when was the last time Denver Broncos won a superbowl?
year[winner == "Denver Broncos"]
broncos <- year[winner == "Denver Broncos"]
broncos[length(broncos)]


# create 'winner2', a copy of the vector 'winner'
winner2 <- winner

# replace some team names in 'winner2' as follows:
# "New York Giants" to "NYG"
# "New York Jets" to "NYJ"
# "Kansas City Chiefs" to "KCC"
winner2[winner == "New York Giants"] <- "NYG"
winner2[winner == "New York Jets"] <- "NYJ"
winner2[winner == "Kansas City Chiefs"] <- "KCC"


# =====================================================
# Losing team
# Write the commands to answer the following questions
# =====================================================

# get the losing teams of the first 5 superbowls
loser[1:5]
head(loser, n = 5)

# get the losing teams of the last 5 superbowls
tail(loser, n = 5)

# create the frequency table 'loser_freq'
# of losing teams
los_freqs <- table(loser)

# What is the team that have lost the superbowl
# the most times?, and how many times?
which.max(los_freqs)
los_freqs[which.max(los_freqs)]



# =====================================================
# Winners and Losers
# Write the commands to answer the following questions
# =====================================================

# how many different teams have played the superbowl?
length(union(winner, loser))

# teams that have played the superbowl and have never lost
setdiff(winner, loser)

# teams that have played the superbowl and have never won
setdiff(loser, winner)

# teams that have played the superbowl (both won and lost)?
intersect(winner, loser)

# how many teams have both won and lost the superbowl?
won_lost <- intersect(winner, loser)
length(won_lost)

# what team won the superbowl in 2000
winner[year == 2000]

# what team lost the superbowl in 2000
loser[year == 2000]

# what teams won the superbowl in the 1970s (1970-1979)
winner[year %in% 1970:1979]

# what teams lost the superbowl in the 1990s (1990-1999)
loser[year %in% 1990:1999]

# create a data frame 'superbowl' with the three vectors:
# year, winner, loser
superbowl <- data.frame(year, winner, loser)

