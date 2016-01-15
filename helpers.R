#################################################################
# Helper functions to be called by script 'build_lectures.R' 
# to generate lecture/index.md and beamer pdf slides 
# Author: Gaston Sanchez
#################################################################

library(knitr)
library(stringr)

# determines whether beamer pdf file does not exist 
missing_pdf <- function(directory) {
  dir_files <- dir(directory)
  !any(grepl('*.pdf', dir_files))
}

# get pathname of Rnw file
Rnw_file <- function(directory) {
  rnw <- grep('*.Rnw', dir(directory), value = TRUE)
  paste0(directory, '/', rnw)
}

# get modification time of Rnw file
Rnw_mtime <- function(directory) {
  file.mtime(Rnw_file(directory))
}

# get pathname of beamer pdf file
pdf_file <- function(directory) {
  pdf <- grep('*.pdf', dir(directory), value = TRUE)
  paste0(directory, '/', pdf)
}

# get modification time of beamer pdf file
pdf_mtime <- function(directory) {
  file.mtime(pdf_file(directory))
}

# determine whether a beamer pdf file needs to be updated
pdf_needs_update <- function(slide_dir) {
  # compare times of Rnw -vs- pdf
  Rnw_mtime(slide_dir) > pdf_mtime(slide_dir)
}

# builds beamer pdf file
build_beamer <- function(lecture) {
  dir_lecture <- paste0('slides/', lecture)
  origin <- getwd()
  setwd(dir_lecture)
  knit(input = paste0(lecture, '.Rnw'), 
       output = paste0(lecture, '.tex'))
  system(paste0('pdflatex ', lecture, '.tex'))
  setwd(origin)
}


# ===============================================================
# Helpers to generate index.md in directory 'lectures'
# ===============================================================

yaml_header <- function(mdfile) {
  cat('---\n', file = mdfile)
  cat('layout: page\n', file = mdfile, append = TRUE)
  cat('title: Lectures\n', file = mdfile, append = TRUE)
  cat('---\n\n', file = mdfile, append = TRUE)
  cat('Fall 2015\n\n', file = mdfile, append = TRUE)
}
#yaml_header('header.md')


slide_title <- function(slide_name) {
  slide_name <- str_sub(slide_name, 4)
  slide_name <- str_replace_all(slide_name, '-', ' ')
  str_to_title(slide_name)
}
#slide_title('02-R-basics')

make_href <- function(lec_name) {
  lec_title <- slide_title(lec_name)
  paste0('\t<li><a href="../slides/', lec_name, '/', lec_name, 
         '.pdf" target="_blank">', lec_title, '</a></li>\n')
}


build_index <- function(mdfile, dir_slides) {
  yaml_header(mdfile)
  all_files <- dir(dir_slides)
  lectures <- grep('[[:digit:]]', all_files, value = TRUE)
  
  # start unordered list
  cat('<ul>\n', file = mdfile, append = TRUE)
  for (lec in lectures) {
    slide_href <- make_href(lec)
    cat(slide_href, file = mdfile, append = TRUE)
  }
  # end unordered list
  cat('</ul>\n', file = mdfile, append = TRUE)
}

