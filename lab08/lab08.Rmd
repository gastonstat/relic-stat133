---
title: "Lab 8"
author: "Your Name"
output: html_document
---

## Strings Basics

### Introduction

The purpose of this lab is to work with some functions to do basic manipulation of strings, as well as introducing you to regular expressions. 

In the first part you will be using with the row names of the data frame `USArrests`

```{r}
head(USArrests)

states <- rownames(USArrests)
head(states)
```

Some functions that you may need to use:

- `nchar()`
- `tolower()`
- `toupper()`
- `casefold()`
- `paste()`
- `substr()`

### Number of characters

`nchar()` allows you to count the number of characters in a string. Use it to get the number of characters of each state:

```{r}
# number of characters

```

### Case folding

There are 3 functions to do case-folding: `tolower()`, `toupper()`, and `casefold()`. Apply each function on `states` to see what happens:

```{r}
# to lower case

```

```{r}
# to upper case

```

```{r}
# case folding (upper = TRUE)

```

```{r}
# case folding (upper = FALSE)

```


### Length of State Names

We just saw how to use `nchar()` to count the number of characters in each state name:
```{r}
# number of charcaters
num_chars <- nchar(states)
```

Use the vector `num_chars` to obtain a frequency table called `char_freqs`, and then plot the frequencies with a bar chart:
```{r}
# frequency table

```

```{r}
# barchart of number-of-characters

```



### Pasting strings

R provides the `paste()` function. This function allows you to __paste__ (i.e. append, concatenate) character vectors separated by a blank space:

```{r}
paste('Pumpkin', 'Pie')
```

You can give it any number of vector inputs
```{r}
paste('a', 'b', 'c', 'd', 'e')
```

You can change the separator with `sep`
```{r}
paste('a', 'b', 'c', 'd', 'e', sep = '-')
```

`paste()` is vectorized:
```{r}
paste('a', 1:5, sep = '.')
```

There's a special wrapper around `paste()` called `paste0()` which is 
equivalent to `paste(..., sep = "")`

```{r}
# paste0() -vs- paste(..., sep = "")
paste0('Pumpkin', 'Pie')
paste('Pumpkin', 'Pie', sep = '')

# paste0() is also vectorized
paste0('a', 1:5)
```


__Your Turn:__ Use `paste()` to form a new vector with the first five states and their number of characters like this:

`"Alabama = 7"  "Alaska = 6"  "Arizona = 7"  "Arkansas = 8"   "California = 10"`

```{r}
# paste names with their num-of-chars

```

Now use `paste90`'s argument `collapse = ''` to _collapse_ the first five states like this:

`"AlabamaAlaskaArizonaArkansasCalifornia"`

```{r}
# collapse first 5 states

```


### Substrings

R provieds the function `substr()` to extract substrings in a character vector:
```{r}
# extract first 3 characters
substr('Berkeley', 1, 3)
```

Use `substr()` to shorten the state names using the first 3-letters:
```{r}
# shorten state names with first 3 characters

```

Use `substr()` to shorten the state names using the last 3-letters:
```{r}
# shorten state names with last 3 characters

```

How would you shorten the state names using the first letter and the last 3-letters? For instance:  `"Aama"` `"Aska"` `"Aona"` `"Asas"` etc.
```{r}
# shorten state names with first 3 characters


```


### Challenge

We already obtained a frequency table `char_freqs` with the counts of state names by number of characters. You can use those frequencies to get those state-names with 4-characters or 10-characters:
```{r}
# 4-char states
states[num_chars == 4]
```

```{r}
# 10-char states
states[num_chars == 10]
```

You can use `paste()` to join the 4-character states in one single string (i.e. _collapsing_) like this---separated by a comma and space---:
```{r}
# collapse 4-char states
paste(states[num_chars == 4], collapse = ", ")
```


__Here's one challenge for you:__ write code (using a for-loop) to obtain a list `states_list` containing the collapsed names by number of characters. If the number of characters is an even number, then the state names should be in capital letters. Otherwise, they should be in lower case letters.

Each list element of `states_list` must be named with the number of characters, followed by a dash, followed by the word `chars`: e.g. `'4-chars'`, `'5-chars'`, etc. In total, `states_list` should have the same length as `char_freqs`.

Here's what `states_list` should look like for the first three elements:

```
$`4-chars`
[1] "IOWA, OHIO, UTAH"

$`5-chars`
[1] "idaho, maine, texas"

$`6-chars`
[1] "ALASKA, HAWAII, KANSAS, NEVADA, OREGON"
```


```{r}
# your code

```


-----

## Regular Expressions

### Preliminaries

First, load the data.

```{r}
library("readr")

flags <- read_csv("https://raw.githubusercontent.com/gastonstat/stat133/master/datasets/flags.csv")
```

We'll be working only with the first column (the `name` column), which contains the names of countries.

```{r}
countries <- flags$name

head(countries)
```

You may have noticed that in the `countries` vector, words in a country's name are separated by `-`.
Let's replace them with spaces, so that for example `American-Samoa` becomes `American Samoa`. (More on this later.)

```{r}
# The syntax is gsub(pattern, replacement, x).
countries <- gsub("-", " ", countries)

# We also could have done chartr("-", " ", countries).

head(countries)
```

### grep

grep is the most basic regex function: it simply returns which elements of a vector match a particular pattern.
For example, suppose we wanted to know which countries have the word `islands` in their name.

```{r}
grep("islands", countries)
```

It would appear that there are none. But that's not actually true.

```{r}
countries[33]
```

So grep failed to match the pattern `islands` to the word `Islands`. There are a couple of ways to fix that.

```{r}
grep("Islands", countries)

# Or
grep("islands", countries, ignore.case = TRUE)
```

The second way has the advantage of being able to match both `islands` and `Islands`, if necessary, as well as `IsLands`, etc.

You can also view the country names instead of their indices.

```{r}
grep("islands", countries, ignore.case = TRUE, value = TRUE)
```

Your turn!
Use grep to find which countries have more than one word in their name. (Hint: What character is present in that case?)

```{r}
# Fill in.
```

### grep Variants

There are several variants of grep suitable for other types of string manipulation.

grepl is identical to grep, but returns a corresponding logical vector instead of a numeric vector.

regexpr and gregexpr are useful for finding the particular location of a match.
regexpr gives the index of the first match (if any) in each element of a vector, while gregexpr gives the indices of all matches and returns a list.

```{r}
regexpr("an", head(countries), ignore.case = TRUE)

gregexpr("an", head(countries), ignore.case = TRUE)
```

sub and gsub are useful for replacing matches.
sub replaces the first match (if any) in each element of a vector, while gsub replaces all matches.

```{r}
sub("an", "BANANA", head(countries), ignore.case = TRUE)

gsub("an", "BANANA", head(countries), ignore.case = TRUE)
```

Your turn!
Replace all instances of `us` (or `US`, etc.) with `United States`, but only output the countries whose names were changed.
(Hint: How can you find which countries contain `us`?)

```{r}
# Fill in.
```

### Metacharacters

So far we only to know how to match literal strings, except for ignoring case.
What if we wanted to know which countries' names start with `A`?
The metacharacter `^` denotes the beginning of the string.

```{r}
grep("^A", countries, value = TRUE)
```

Similarly, the metacharacter `$` denotes the end of the string.

Your turn!
Find which countries' names end in `stan`.

```{r}
# Fill in.
```

You may have noticed that metacharacters are not treated literally.
If you want to match a metacharacter, make sure to precede it by `\\`, as in `\\^'.
If you want to match `\`, use `\\\\`.

Suppose you wanted to know which countries' names start with `A` and whose third letter is `g`, but you didn't care about the second letter? The metacharacter `.` represents any character.

```{r}
grep("^A.g", countries, value = TRUE)
```

The metacharacters `?`, `*`, and `+` modify the previous item: `?` matches zero or one times, `*` matches any number of times (including zero), and `+` matches at least once.
So `.*` matches any character string, while `.+` matches any non-empty character string.

Your turn!
Find which countries' names start with `S` and have an `l` in their name.

```{r}
# Fill in.
```

### Character Classes

What if you wanted to know which countries' names start with `A` or `Z`? The metacharacter `|` functions as a logical or.
Left and right parentheses (`(` and `)`) are also metacharacters used for grouping.

```{r}
grep("^(A|Z)", countries, value = TRUE)
```

If you want to do this for, say, any vowel, you would have to write `(A|E|I|O|U)`, for example.
Character classes simplify this: the character class for the preceding expression is just `[AEIOU]`.
The previous code chunk can be equivalently written as follows:

```{r}
grep("^[AZ]", countries, value = TRUE)
```

Several character classes are predefined in R.
For example, `[:digits:]` is equivalent to `0123456789`, and `[:lower:]` is equivalent to `abcdefghijklmnopqrstuvwxyz`.
So the character class `[0123456789]` can be more easily written as `[[:digits:]]`, etc.
See the regex documentation for R for a more extensive list of predefined character classes.

Your turn!
Find which countries' names start with two or more vowels.

```{r}
# Fill in.
```

Finally, when inside of a character class, `^` denotes negation, so `[^AZ]` matches any character except `A` or `Z`.

Your turn!
Find which countries' names start with a vowel and end in a consonant.

```{r}
# Fill in.
```
