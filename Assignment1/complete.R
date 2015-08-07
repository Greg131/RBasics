complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        ## Conversion d'un id en nom de fichier
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
        

        for (i in id) {
                file_name <- paste(directory,"/",convid(i), sep = "")
                data <- read.table(file_name, T, ",")  
                nobs <- sum(complete.cases(data))
                if (i==id[1]) { 
                        df <- data.frame (id = i, nobs = nobs) 
                } else {
                        df <- rbind(df,data.frame (id = i, nobs = nobs))
                }
        }
        df
}