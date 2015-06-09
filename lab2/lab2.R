
load(file = "superbowl_champions.RData")

ls()

# year
class(year)

# winner
class(winner)

# loser
class(loser)

# do they have the same length?
length(year)
length(winner)
length(loser)


# =================================================
# winning team
# =================================================
# how many unique champions?
unique(winner)

# table frequencies
win_freqs <- table(winner)

# frequencies of frequencies
table(win_freqs)

# most times champion
which.max(win_freqs)
win_freqs[which.max(win_freqs)]

# sort frequencies
champions <- sort(win_freqs, decreasing = TRUE)

# some barplots
barplot(champions)
barplot(champions, horiz = TRUE)
barplot(champions, horiz = TRUE, las = 2)

op <- par(mar = c(5, 11, 2, 2))
barplot(champions, horiz = TRUE, las = 2)
par(op)


# 49ers championships
year[winner == "San Francisco 49ers"]

# Oakland Raiders championships
year[winner == "Oakland Raiders"]

# when was the last time Denver Broncos won?
year[winner == "Denver Broncos"]
broncos <- year[winner == "Denver Broncos"]
broncos[length(broncos)]

# replacing some winner names
winner2 <- winner
winner2[winner == "New York Giants"] <- "NYG"
winner2[winner == "New York Jets"] <- "NYJ"
winner2[winner == "Kansas City Chiefs"] <- "KCC"


# first 5 champions
winner[1:5]
head(winner, n = 5)

# last 5 champions
tail(winner, n = 5)


# =================================================
# losing team
# =================================================
# loser_freq
los_freqs <- table(loser)

# most losing team, and how many times
which.max(los_freqs)
los_freqs[which.max(los_freqs)]



# how many different teams have played superbowl?
length(union(winner, loser))

# teams that have played superbowl and have never lost
setdiff(winner, loser)

# teams that have played superbowl and have never won
setdiff(loser, winner)

# how many teams have played superbowl (both won and lost)?
won_lost <- intersect(winner, loser)
won_lost
length(won_lost)
