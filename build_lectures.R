#################################################################
# Generates lecture/index.md and beamer pdf slides 
# Author: Gaston Sanchez
#################################################################

# ===============================================================
# Helpers to generate md files with yaml header
# ===============================================================

source('helpers.R')

# ===============================================================
# Generating Beamer Slides:
# Are there any Rnw files that need to be converted to pdf?
# ===============================================================

working_dir <- getwd()
all_files <- dir('slides')
lectures <- grep('[[:digit:]]', all_files, value = TRUE)

for (lec in lectures) {
  dir_name <- paste0('slides/', lec)
  if (missing_pdf(dir_name)) {
    build_beamer(lec)
  } else {
    if (pdf_needs_update(dir_name)) {
      build_beamer(lec)
    }
  }
}

setwd(working_dir)


# ===============================================================
# Building lectures/index.md
# ===============================================================

#build_index('header.md', 'slides')
build_index('lectures/index.md', 'slides')



