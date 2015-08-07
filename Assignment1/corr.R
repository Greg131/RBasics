corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        convid <- function (id) {
                base <- as.character(id)
                if (nchar(base)==1) {
                        file_name <- paste("00",base,".csv", sep = "")
                } else if (nchar(base)==2) {
                        file_name <- paste("0",base,".csv", sep = "")       
                } else {
                        file_name <- paste(base,".csv", sep = "") 
                }
                file_name
        }
#       source("complete.R")
#       df <- complete("directory")
        corr <- vector(mode = "numeric")
        for (i in 1:332) {
                file_name <- paste(directory,"/",convid(i), sep = "")
                data <- read.table(file_name, T, ",")  
                nobs <- sum(complete.cases(data))
                cdata <- data[complete.cases(data),]
                if (nobs>threshold) { 
                         corr[length(corr)+1] <- cor(cdata$nitrate,cdata$sulfate)
                }
        }
        corr
        


}