best <- function(state, outcome) {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        
        state_names <- unique(data$State)
        state_names
        if (sum(state==state_names) != 1) {
                stop("invalid state")
        }
        if (!((outcome == "heart attack") | (outcome == "heart failure" ) | (outcome =="pneumonia"))) {
                stop("invalid outcome")
        }
        
        subdata <- data[data$State == state,c(2,7,11,17,23)]
        subdata[, 3] <- as.numeric(subdata[, 3])
        subdata[, 4] <- as.numeric(subdata[, 4])
        subdata[, 5] <- as.numeric(subdata[, 5])
        
        subdata <- subdata[complete.cases(subdata),]
        
        if (outcome == "heart attack") {
                min <- min(subdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
                best <- subdata$Hospital.Name[subdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min]
                best
        } else if (outcome == "heart failure" ) {
                min <- min(subdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
                best <- subdata$Hospital.Name[subdata$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == min]
                best
        } else if (outcome =="pneumonia") {
                min <- min(subdata$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
                best <- subdata$Hospital.Name[subdata$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == min]
                best
        }
        ## Return hospital name in that state with lowest 30-day death
        
        best <- sort(best)[1] #  trié
        
        ### Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.
        
        
        
}
