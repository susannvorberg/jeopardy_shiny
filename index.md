---
title       : Pitch Presentation
subtitle    : The game of Jeopardy
author      : Susann Vorberg
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
## Introduction

This presentation is part of the assignment for the [Coursera Developing Data
Products course](https://www.coursera.org/learn/data-products).

It is thought to be a pitch presentation for an application developped with
the R package Shiny. I developed a Shiny App that simulates the famous TV Show
Jeopardy in form of a quizz. The Shiny App can be found at:

https://susannvorberg.shinyapps.io/data_products_shiny_quizz/

In the following slides I will give background information regarding
the game Jeopardy and the dataset I have used.

--- 

## Jeopardy!

is an American TV game show, that was first aired on NBC on March 30th, 1964. 

__Gameplay__

Three contestents and a returning champion compete in a quiz game comprising three rounds
- Jeopardy!
- Double Jeopardy!
- Final Jeopardy!

Questions come from a wide range of topics, including history and current events, the sciences, the arts, popular culture, literature, and languages.
Category titles often feature puns, wordplay, or shared themes, and the host will regularly remind contestants of topics or place emphasis on category themes before the start of the round.


Source https://en.wikipedia.org/wiki/Jeopardy!

---

## The Dataset

The Jeopardy! dataset was taken
from
https://www.reddit.com/r/datasets/comments/1uyd0t/200000_jeopardy_questions_in_a_json_file

It contains 216,930 Jeopardy questions that were gathered from
www.j-archive.com. The dataset comes as an unorderd list with the follwing
entries: 



```r
library(rjson)
json_data <- fromJSON(file='/usr/users/svorber/work/scripts/data_products_shiny_quizz/app/JEOPARDY_QUESTIONS1.json')
length(json_data)
```

```
## [1] 216930
```

```r
names(json_data[[1]])
```

```
## [1] "category"    "air_date"    "question"    "value"       "answer"     
## [6] "round"       "show_number"
```


---

## The Jeopardy Shiny App

The Jeopardy Shiny App presents a simplified version of Jeopardy! that can be extended for several features. 

Instead of playing against other contestents, the App features a single player game. 
By pressign the submit button, the player's answer will be compared against the correct answer in the dataset. 
If the answer is correct, the value of the question is added to the player's score. 
In case of an incorrect answer, the value of the question is substracted from the player's score. 
A player can always skip questions, obtaining one penalty point. 

Future extensions of the App
- filtering questions for categories
- multiplayer mode
- plotting statistics of the gameplay






