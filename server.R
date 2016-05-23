#increase file input size to 10MB
options(shiny.maxRequestSize = 10*1024^2)

library(shiny)
library(wordcloud)
library(tm)
library(SnowballC)
library(tools)

shinyServer(function(input, output) {
    #execute when the go button is pressed
    observeEvent(input$go,{    
        
        #output$contents <- renderTable({
        # input$file1 will be NULL initially. After the user selects
        # and uploads a file, it will be a data frame with 'name',
        # 'size', 'type', and 'datapath' columns. The 'datapath'
        # column will contain the local filenames where the data can
        # be found.
        
            inFile <- input$file1
            if (is.null(inFile))
                return(NULL)

            
            dir <- inFile$datapath
            text=read.csv(inFile$datapath)
            wordfreq <- substr(text, 1, nchar(text) - 1)
            words <- Corpus(VectorSource(text))
            
            #Remove whitespace, change to lowercase and remove numbers
            words <- tm_map(words, stripWhitespace)
            words <- tm_map(words, content_transformer(tolower))
            words <- tm_map(words, removeNumbers)
            #Also remove punctuation and stopwords if selected
            if (input$nostop) words <- tm_map(words, removeWords, stopwords("SMART"))
            if (input$nopunc) words <- tm_map(words, removePunctuation)

            # Reactive element to generate the wordcloud and save it as a png
            # and return the filename.
            plotCloud <- reactive ({
                #fname="wordcloud.png"
                par(mar=c(2,1,1,0.1))
                fname=paste(file_path_sans_ext(inFile$name),'-wordcloud.png',sep="")
                png(paste(file_path_sans_ext(inFile$name),'-wordcloud.png',sep=""),width=4,height=5,units='in',res=360)
                plotCloud <- wordcloud(words,
                                   scale = c(5, 0.5),
                                   min.freq=input$minfreq,
                                   max.words=input$maxwords,
                                   use.r.layout=FALSE,
                                   colors=brewer.pal(5, "RdBu"))
                dev.off()
                
                filename <- paste(file_path_sans_ext(inFile$name),'-wordcloud.png',sep="")
            })
            #Show wordcloud
            output$wordcloud <- renderImage({
                list(src=plotCloud(), alt="Plotting cloud...", height=600)
            },
            deleteFile = FALSE)
            
            # observeEvent(input$wordcloudImg, {
            #     # Download handler for wordcloud
            #     output$plotWordcloud <- downloadHandler(
            #         filename = function() {paste(file_path_sans_ext(inFile$name),'-wordcloud.png',sep="")},
            #         content = function(cloud) {
            #             file.copy(plotCloud(), cloud)
            #         })
            # })
            # 
            # # Download handler for freq output file
            # observeEvent(input$wordFreq,{
            #     output$freqOut <- downloadHandler(
            #         filename = function() {paste(file_path_sans_ext(inFile$name),'-freq.csv',sep="")},
            #         content = function(freq) {
            #          docmat <- DocumentTermMatrix(words)
            #          sortfreq <- sort(colSums(as.matrix(docmat)), decreasing=TRUE)
            #          write.csv(sortfreq, file=paste(file_path_sans_ext(inFile$name),'-freq.csv',sep=""))
            #         })
            # })
            
    })
})