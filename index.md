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
- A text file (sample available at <a href="github.com/gmuldoon/DataProducts-coursera/tree/master">github.com/gmuldoon/DataProducts-coursera/tree/master</a>)
- Minimum frequency a word must appear to be included
- Maximum number of words to show in the wordcloud
- Whether or not to include punctuation
- Whether or not to include stop words (common words like the, and, etc.)

Note: Numbers are automatically removed, stemmed words are combined, and all words are changed to lower case

The ui.R and server.R for this app are available at: 
<br>
<a href="https://github.com/gmuldoon/DataProducts-coursera/tree/master">https://github.com/gmuldoon/DataProducts-coursera/tree/master</a>
<br>

--- .class #id 

## 

<!-- <br> -->
<div style='text-align: center;'>
Modifications are possible to also output the file of word frequency: 
</div>


```r
ggplot(data=freq[1:25,],aes(x=reorder(word,-frequency),y=frequency))+
    geom_bar(stat="identity",width=0.75)+theme_classic()+
    theme(axis.text.x = element_text(angle=45, hjust=1,size=12))+
    labs(title="Top 10 Words in Alice in Wonderland",x="",y="frequency")
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)


