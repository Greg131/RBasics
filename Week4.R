#----------------------------------------------------------
# Week 4: str function
# ----------------------------------------------------------

# Compactly display internal structure of an R object
# Alternative à summary

str(str)
str(lm)
str(ls)
x <- rnorm(100,2,4)
summary(x)
str(x)
f <- gl(40,10)
f
str(f)
summary(f)
library(datasets)
head(airquality)
str(airquality)
m <- matrix(rnorm(100),10,10)
str(m)
m
m[,1]
s <- split(airquality,airquality$Month )
str(s)

#----------------------------------------------------------
# Week 4: Simulation - Generating Random Numbers
# ----------------------------------------------------------

# rnorm : generate random Normal variates with a given mean and sd
# dnorm : evaluate the Normal probability density (with a given mean/sd)
#               at a point (or vector of point) ???
# pnorm : evluate the cumulative distribution function for a Normal distribution
# rpois : generate a random Poisson variates with a given rate

# d for density
# r for random number generation
# p for cumulative dictribution
# q for quantile function

dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tai = TRUE , log.p = FALSE)
qnorm(q, mean = 0, sd = 1, lower.tai = TRUE , log.p = FALSE)
rnorm(n, mean = 1, sd = 1)

# pnorm(q) = phi(q) si phi est la cumulative distr function for a std N dist


# Generate

x <- rnorm(10)
x
x <- rnorm(10,20,2)
x
summary(x)

set.seed(1)
a <- rnorm(5)
rnorm(5)
rnorm(5)
rnorm(5)


set.seed(1) # fixe la sequence de nb ... permet de revenir et avroir les mêmes resultats
b <- rnorm(5)
rnorm(5)
rnorm(5)
rnorm(5)

identical(a,b)

?rpois
rpois(10,1) # 10 avec rate of 1
rpois(10,2)
rpois(10,20)


ppois(2,2) # cumulatice distrib (proba d'avoir <= 2 avec xxx 2)

ppois(4,2) # Pr (x<=4)
ppois(6,2) # Pr (x<=6)


#-----------------------------------------------------------
# Week 4: Simulation - Simulating a Linear Model
# ----------------------------------------------------------

# y = b0 + b1x + epsilon
# epsilon ~ N(0,2^2)
# x ~ N (0,1)
# b0 = 0.5 b1 = 2

set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x +e
summary(y)
plot(x,y)


# x binaire
set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x +e
summary(y)
plot(x,y)

# Poisson model
# Y ~ Poisson(mu)
# log mu = b0 + b1x follow a linear model
# b0 = 0.5, b1 = 0.3
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)


#-----------------------------------------------------------
# Week 4: Random Sampling
# ----------------------------------------------------------

sample(1:10, 4)
sample(1:10, 4)

sample(letters, 4)

sample(1:10) # permutation

sample(1:10, replace = TRUE)

# toujours fixer seed pour pouvoir reproduire...

#-----------------------------------------------------------
# Week 4: R Profiler
# ----------------------------------------------------------


# system.time()
# R expr
# temps d'execution ou jusqu'à l'erreur
# Class "proc_time

# User time time charged to the CPU
# elapsed timme : "wall clock" time

st <- system.time(rnorm(10000000))
class(st)
st

# user time / ellapse time
# multi core... ou  elts externes
# R does not use mult Core but
# lib linear algebra use multiple core


## Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))

## Elapsed time < user time
hilbert <- function(n) {
        i <- 1:n
        1 / outer(i-1, i, "+")
}
x <- hilbert(1000)
system.time(svd(x)) # singular value dec accel framework pn the Mac 
# si multi core

system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})


#-----------------------------------------------------------
# Week 4: R Profiler part 2
# ----------------------------------------------------------

Rprof()
# R must be compiled with support profiler

summaryRprof() # summarizes the output from 

# NB pas Rprof() & system.time....

# default sampling 0.02 s
# keep track of the function call stack at reg sampled interv

# by.total & by.self

# by.self temps passe dans un fonction après soustraction des sous-appels

# $by.total
# $by.self
# $sample.interval
# $sample.time


#-----------------------------------------------------------
# Week 4: Quizz
# ----------------------------------------------------------

set.seed(1)
rpois(5, 2)

set.seed(1)
rpois(5, 2)


set.seed(10)
x <- rep(0:1, each = 5)
x
e <- rnorm(10, 0, 20)
e
y <- 0.5 + 2 * x + e
y


#------------------------------------------------------------------
# Assignment 2
#-------------------------------------------------------------------

makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

# Assignment: Caching the Inverse of a Matrix

# makeCacheMatrix: 
# This function creates a special "matrix" object that can cache its inverse.

# cacheSolve: 
# This function computes the inverse of the special "matrix" 
# returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.

x <- 1:10
y <- makeVector(x)
y
class(y)
names(y)
y
cachemean(y)


#------------------------------------------------------------------
# Assignment 3
#-------------------------------------------------------------------

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
summary(outcome)
str(outcome)
ncol(outcome)
names(outcome)

copie_outcome <- outcome
copie_outcome[1:10,11]
outcome[, 11] <- as.numeric(outcome[, 11])
head(outcome[, 11])
summary(outcome[, 11])
hist(outcome[, 11])

names(outcome)

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
debug(best)

t <- best("TX", "heart attack")
t

t <- best("TX", "heart failure")
t

t <- best("MD", "heart attack")
t

t <- best("MD", "pneumonia")
t

t <- best("BB", "heart attack")
t

best("NY", "hert attack")

sum("xx"==state_names)
help(find)
help(message)
names(data)
outcome==names(data)


rankhospital <- function(state, outcome, num = "best") {
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
        
        subdata <- subdata[complete.cases(subdata),] #???
        
        
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
        hosp
}
## Check that state and outcome are valid
## Return hospital name in that state with the given rank

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

rankhospital("AZ", "heart attack",20)

