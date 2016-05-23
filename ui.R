

shinyUI(fluidPage(
    titlePanel("Make Your Own Wordcloud!"), 
    
    sidebarLayout(
        sidebarPanel(
            
            fileInput('file1', 'Choose file to upload',
                      accept = c(
                          'text/csv',
                          'text/comma-separated-values',
                          'text/tab-separated-values',
                          'text/plain',
                          '.csv',
                          '.tsv'
                      )
            ),
            hr(),
            # Slider input for frequency change
            sliderInput("minfreq", "Minimum word frequency:",
                        min = 1, max = 100, value = 5),
            # Slider input for number of words change
            sliderInput("maxwords", "Max words:",
                        min = 10, max = 500, value = 50) ,
            checkboxInput("nopunc",label="Remove punctuation",value=TRUE),
            checkboxInput("nostop",label="Remove stop words",value=TRUE),
            actionButton("go", "Make wordcloud!")
        ),
    #Plot the word cloud
    mainPanel(
        # Wordcloud image rendered
        imageOutput("wordcloud")
        # hr(),
        # # Image download button
        # downloadButton("wordcloudImg", "Download wordcloud"),
        # # CSV download button
        # downloadButton("wordFreq", "Download word frequencies (.csv)"))
    )
    )
))
