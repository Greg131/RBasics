pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        
        
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
        
        # Boucle sur la séquence d'indice
        for (i in id) {
                file_name <- paste(directory,"/",convid(i), sep = "")
                newdata <- read.table(file_name, T, ",")
                if (i==id[1]) { 
                        data <- newdata 
                } else {
                        data <- rbind(data,newdata)
                }
        }
        
        # Calcul de la moyenne
        if (pollutant=="sulfate") {
                mean = mean(data$sulfate, na.rm = TRUE)
        } else if (pollutant=="nitrate") {
                mean = mean(data$nitrate, na.rm = TRUE)
        }
        # pas possible de faire data$pollutant...
        mean
}