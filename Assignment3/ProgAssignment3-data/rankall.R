rankall <- function(outcome, num = "best") {
        ## test outcome
        if (!((outcome == "heart attack") | (outcome == "heart failure" ) | (outcome =="pneumonia"))) {
                stop("invalid outcome")
        }
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        state_names <- sort(unique(data$State))
        
        state_names
        ## Check that state and outcome are valid
        
        ## Creation du data frame
        rankall <- data.frame(hospital = NA , state = state_names, row.names = state_names)
        
        
        
        
        ## For each state, find the hospital of the given rank
        for (state in state_names) {
                
                subdata <- data[data$State == state,c(2,7,11,17,23)]
                subdata[, 3] <- as.numeric(subdata[, 3])
                subdata[, 4] <- as.numeric(subdata[, 4])
                subdata[, 5] <- as.numeric(subdata[, 5])
                
                subdata <- subdata[complete.cases(subdata),] # on ne guarde que les hopitals complets
                
                if (outcome == "heart attack") {
                        subdata <- subdata[order(subdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,subdata$Hospital.Name ), ]
                } else if (outcome == "heart failure" ) {
                        subdata <- subdata[order(subdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,subdata$Hospital.Name ), ]
                        
                } else if (outcome =="pneumonia") {
                        subdata <- subdata[order(subdata$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,subdata$Hospital.Name ), ]    
                }  
                
                
                l <- length(subdata$Hospital.Name)
                if (num=="best") {
                        hosp <- subdata$Hospital.Name[1]
                } else if (num == "worst") {
                        hosp <- subdata$Hospital.Name[l]
                } else if ((num >= 1) && (num <=l)) {
                        hosp <- subdata$Hospital.Name[num]
                } else {
                        hosp <- NA
                }      
                
                
                rankall[state,"hospital"] <- hosp
        }
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        rankall
}
