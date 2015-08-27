
setwd('~/Documents/stat133')
dat <- read.csv('Grades_STAT_133.csv', stringsAsFactors = FALSE)

dim(dat)
head(dat)

# points
points <- c(0.20, 0.20, 0.15, 0.15, 0.30)

# homework
hws <- dat[ ,paste0('hw', 1:7)]
hw <- apply(hws, 1, function(x) mean(x, na.rm=TRUE))

items_df <- data.frame(
  attendance = dat$roll,
  homework = hw,
  midterm = dat$midterm,
  final = dat$final,
  project = dat$project
)

items <- as.matrix(items_df)

grades <- as.vector(items %*% points)
names(grades) <- dat$Student
grades

letter <- cut(grades, 
    breaks = c(0, seq(70, 100, 3.33)), 
    labels = c('F', 'C-','C', 'C+', 'B-', 'B', 'B+', 'A-', 'A', 'A+'))

data.frame(
  grades,
  letter)