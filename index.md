---
title       : Wordcloud App
subtitle    : Make a wordcloud from any text file!
author      : Gail Muldoon
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Now you can:
- Visualize a text
- Get the main topics at a glance
- Find the most important words in a document
 <div style='text-align: center;'>
    <img height='560' src='AliceinWonderland-wordcloud.png' />
</div>
For any text file!



--- .class #id 

## The App: https://gmuldoon.shinyapps.io/Project/
 
<div style='text-align: center;'>
    <img height='560' src='wordcloud-app.png' />
</div>


--- .class #id 

## How to make your wordcloud

Select:
- A text file 
(sample available at https://github.com/gmuldoon/DataProducts-coursera/tree/master)
- Minimum frequency a word must appear to be included
- Maximum number of words to show in the wordcloud
- Whether or not to include punctuation
- Whether or not to include stop words (common words like the, and, etc.)

Note: Numbers are automatically removed, stemmed words are combined, and all words are changed to lower case

--- .class #id 

## 

<!-- <br> -->
<div style='text-align: center;'>
The ui.R and server.R for this app are available at: 
<br>
<br>
<a href="https://github.com/gmuldoon/DataProducts-coursera/tree/master">https://github.com/gmuldoon/DataProducts-coursera</a>
<br>
<br>
<br>
Modifications are possible to also output the file of word frequency for further analysis: 
</div>
<!-- <div style='text-align: center;'> -->
![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png)
<!-- </div> -->


