---
layout: lecture
title: "Regex"
---

<p class="message">
  Getting started with regular expressions
</p>

### Slides

<a href="https://github.com/ucb-stat133/stat133-fall-2016/blob/master/notes/14-strings-basics/14-strings-basics.pdf" target="_blank">Regular Expressions</a>


### Regular Expressions Basics

We are going to illustrate examples using:

<a href="http://regexpal.com.s3-website-us-east-1.amazonaws.com/?_ga=1.148350583.1788102676.1470354764" target="_blank">Regexpal</a>

- What are Regular Expressions?
    + Regular expressions are all about text
    + They are are symbols that describe text patterns
    + They are NOT a programming language
- What are regular expression used for?
    + Used for matching, searching, and replacing text
- Usage examples:
    + Test if a phone number has the correct number of digits
    + Test if an email address is in a valid format
    + Search a document for either `"color"` or `"colour"`
    + Replace all occurrences of "Bob", "Bobby", or "B." with `"Robert"`
- Characters
    + Literal Characters
    + Metacharacters
    + The wildcard metacharacter
    + Escaping metacharacters
    + Other special metacharacters
- Character sets
    + Defining a character set
    + Character ranges
    + Negative character sets
    + Metacharacters inside character sets
    + POSIX bracket expressions
- Repetition Expressions
    + Repetition metacharacters
    + Quantified repetition
