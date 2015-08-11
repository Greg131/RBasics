# ----------------------------------------------------------
# Week2 : Control Structures - Introduction
# ----------------------------------------------------------

# if, else : testing a condition
# for : execute a loop a fixed number of time
# while : execute a loop while a condition is true
# repeat : execute an infinite loop
# break : break the execution of a loop (any type...for, while, repeat)
# next : skip an iteration of a loop
# return : exit a function


# ----------------------------------------------------------
# Week2 : If-Else
# ----------------------------------------------------------

condition <- F
condition2 <- T
condition
if (condition) {
  2+5  
  "true"
} else {
  3+7   # ne sera pas affiche...
  print(3+7)
  "Faux"
}

{
  3+7   # ne sera pas affiche...
  "Faux"
  "Vrai"
}
# Expression. tout est evalue mais seule la derniere instr est affichee


condition
condition2
condition3 <- T

# autant de else if que necessaire... else doit etre a la fin
if (condition) {
  2+5  
  "true"
} else if (!condition2) {
  3+7
} else if (condition3) {
    3+7
    print("condition 3")
} else {
  3+70
  print('else final')
}

if (T) {
  2+5  
} else if (T) {
  3+7
} else if (F) {
  print("condition 3")
} else {
  3+70
  print('else final')
}

# Seul le premier TRUE est evalue


x <- 5

# Classique
if (x>3) {
  y <- 10
} else {
  y <- 0
}
y
# Assignation de y avec toute la condition
y <- if (x>3) {
  10
} else {
  0
}

# Assignation de y avec toute la condition
y <- if (x>3) {
  10
  z <- "high"
  20
  30
} else {
  0
}

y   # expressions.. seule la derniere est affichee...
z

# Else pas necessaire
if (x>3) {
  #...
}
if (condition2) {
  #...
}


# ----------------------------------------------------------
# Week2 : For loops
# ----------------------------------------------------------
# couvre une sequence ou vector (une sequence est un vecteur numeric, ...)
for (i in 1:10) {
  print(i)
}

x <- c("a","b","c","d")

for(i in 1:4) {
  print(x[i])
}

class(x)
seq_along(x) # cr?? une sequence d'entier de la taille du vecteur argument
class(seq_along(x))

for(i in seq_along(x)) {
  print(x[i])
}

for(i in x) {
  print(i)
}


for(letter in x) {
  print(letter)
}

# si seulement une expression dans la boucle crochets non necessaires
# les {} sont des expressions, .....
for(i in 1:4) 
  print(x[i])

# avec une liste un factor un data frame?
x <- factor(c("yes","aaa","abaaa","zz","zz"))
class(x)
x
for(y in x) {
  z <- class(y) # attention dans les boucles les instructions ne sont pas auto print??es?
  print(z) # explicitement ...
  print(y)
}

x <- factor(c(1,23,34,56))
for(y in x) {
  z <- class(y) # attention dans les boucles les instructions ne sont pas auto print??es?
  print(z) # explicitement ...
  print(y)
}


alc4 <- read.table("alcool.csv", T, ";")  # file name, header T/F, separateur
for(y in alc4) {
  print(y)
  print("---------parcour les colonnes-------")
  z <- class(y)
  print(z)
  m <- mean(y,na.rm=TRUE)
  print(m)
  print("-------------------------------")
  
}

# Imbrication
x <- matrix(1:6, 2,3)
x
seq_len(nrow(x)) # cree une sequense de longueur specifiee

for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}

for (i in seq_len(nrow(x))) {
        for (j in seq_len(ncol(x))) {
                print(x[i,j])
                if (j>1){break}
        }
}


# Attention avec 2 ou 3 niveaux c'est difficile a lire

# ----------------------------------------------------------
# Week2 : While loops
# ----------------------------------------------------------

count <- 0
while(count < 10) {
  print(count)
  count <- count +1
}

# Attention a la condition d'arret... plus sur d'utiliser for loop si possible


z <- 5

help(rbinom)
rbinom(1,1,0.5)

while (z >=3 && z <= 10) {
  print(z)
  coin <-  rbinom(1,1,0.5) # tirage a pile ou face une fois
  coin
  print("----------coin----------")
  print(coin)
  print("--------------------")
  if (coin == 1) {
    z <- z+1
  }  else { 
    z < z-1
  }
}

# pour info la condition est evaluee de gauche a droite...

# ----------------------------------------------------------
# Week2 : Repeat, next, break
# ----------------------------------------------------------

x0 <- 1
tol <- 1e-8
tol
class(tol)

# dangereux ....
repeat {
#    x1 <- computeEstimate()
    x1 <- 1+tol/2    # sinon dangereux....
    if (abs(x1-x0) < tol ) {
      break
    } else {
      x0 <- x1
    }
}
# Utiliser for loop ou max iter....

for (i in 1:100) {
  if (i<=90) {
    next   # et donc repart dans la boucle sans  faire do smth
  }
  #do smth here
  print(i)
}


# Return signal that a function should be exit and return a given value

# pour interactive work the *apply function are more usefull


# ----------------------------------------------------------
# Week2 : Your First R function
# ----------------------------------------------------------

add2 <- function(x,y) {
  x+y
}
# pas de return.... return the last expression

add2(2,3)
x <- c(1,3,5,6)
y <- c(6,5,6,5)
add2(x,y)

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above10(1:20)
x
above10(x)
above10(5*x)

above <- function(x,n) {
  use <- x > n
  x[use]
}

above(10,6)
above(1:20,4)
above(10)
# Valeur par d??faut des param??tres
above <- function(x,n = 10) {
  use <- x > n
  x[use]
}
above(11)
above(10)
above(9)

# Calcul de la moyenne de chaque colonne d'une matrice ou d'un data frame

columnmean <- function(x, removeNA = TRUE) {
  nc <- ncol(x)
#  means = vector("numeric",nc)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(x[,i], na.rm = removeNA)
  }
  means
}

x <- matrix (1:20, 4,5)
x
columnmean(x)
columnmean(2*x)

# ----------------------------------------------------------
# Week2 : Functions
# ----------------------------------------------------------

# funtion() directive... & stored as R Object
class(columnmean)
# "function"

# function can be passed as argument to other function, ... 
# can be nested (define a function inside an other function )
# The return value is the last expression to be evaluated

# Named argument, wiich have potentially defaut values
# formal arguments...formal function return a list of all f arg ??

# Argument matching : position or names

help(rnorm)
mydata <- rnorm(100)
mydata <- rnorm(100, mean = 10, sd = 2)
class(mydata)
hist(mydata)

str(sd)
sd(mydata)
sd(x = mydata)
sd(x = mydata,F)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata) # fonctionne egalement...pares enlev na.rm de la liste ordre, ...

# Position macching and name can be mix
args(lm)
str(lm)


names(alc4)
# 2 calls equivalents
lm(data=alc4, alc4$t ~ alc4$AGE, model = FALSE, 1:100)
lm(alc4$t ~ alc4$AGE, alc4,1:100, model = FALSE)


# Ex plotting function ... large arg list with default values...

# exact matc, partiel match, positional match

# ----------------------------------------------------------
# Week2 : Defining a Function
# ----------------------------------------------------------

f <- function(a,b=1,c=2,d=NULL){
  
}

# NULL there is nothing there
f
str(f)
args(f)

# Lazy Evaluation - arg evaluated only when needed

f <- function(a,b) {
  print(a)
  print(b)
}



f(45)
f(25,47)
f(25,"azer")
f(a=25)
f(b=2,a=5)


f <- function(a,b) {
        print(a)

}
f(45)

f <- function(a,b = NULL) {
  print(a)
  print(b)
}

f(45)
f(25,47)
f(25,"azer")
f(a=25)
f(b=2,a=5)


# The "..." argument : variable number of arg

# 1) used when extending another function
myplot <- function(x,y,type = "1", ...) {
  plot(x,y,type=type,...)
}

# 2) generic functions do nothing but dispach data, ...

# 3) when number of arg cannot be known in advanced...

args(paste)
args(cat)

# les arguments venant apres "..." doivent etre nomes explicitement et exactement 

paste("a","b", sep =":")
paste("a","b", se =":") # attention pas de partial matching...

# ----------------------------------------------------------
# Week2 : Scoping Rules - Symbol Binding
# ----------------------------------------------------------

ls()

# 1) Global environement
# 2) search list of R package loaded currently into R

# ex lm <- function(){...}
search()
class(search())
search()[2]
library(Epi)
search()
search()[2]

# base package always at the end

# a chaque load le package vient en position 2 apres global evt

# noter qu'il y a des noms pour les functions et les autre obj
# donc une variable peut s'appeller lm sans conflit avec lm()...

sd <- 1
sd
sd(x = mydata)


# Scoping rule : how a value is associated with a free variable

# Dans ls fonctions, les arg et les autres
#...lexical scoping ou static scoping
# alternative a dynamic scoping

z <- 0

f <- function (x,y) {
  x^2+y/z
}

# Lexical scoping in R means that 
# Les valeur des variables libres sont cherchees dans l'environnement 
# dans lequel la fonction a ete definie 

# Un evironement est une collection de paires (symbol, value)
# Chaque environnement a un environnement pere, 
# Il est possible d'avoir plusieurs environemenrts fils, ...
# Seul l'environnement vide n'a pas de pere
# Une fonction + environnement = "closure" ou "function closure"


# ex si fonction def dans glogbal evt... global puis parent search
# ex si def dans 
f(2,3)
z


# top level evt usually global, ou package pour une f def dansun pack
# empty evt after the base package...


f <- function (x,y) {
  z <-2
  z
}

z <- 5
f(2,3)
z

f <- function (x,y) {
  z
}

z <- 5
f(2,3) # dans ce cas trouve z dans le global evt ... 5
z

#----------------------
x

fx <- function(x){
  x <-0
  x
}
fx(x)
x

# ----------------------------------------------------------
# Week2 : R Scoping Rules 
# ----------------------------------------------------------

# General - function definies sur global evt
# dans ce cas on peut avoir variables "Globales" des fonctions def dans evt glob

# function defined inside other function
# for ex a function can return a function
# ....environnement de def <> global

make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

# fonction qui construit des fonctions
cube <- make.power(3)           # dans l'env de definition n vaut 3...
cube(8)
n <- 2
cube(8)

cube <- make.power(3)           # dans l'env de definition n vaut 3...

square <- make.power(2)
squareroot <- make.power(0.5)
class(cube)
cube(2)
squareroot(2)

n <- 1
make.power.glob <- function() {
  pow.glob <- function(x) {
    x^n
  }
  pow.glob
}

n <- 10
cube <- make.power.glob()           # dans l'env de definition n vaut 10...
cube(2)

n <- 1
cube(2)         # dans l'env de definition n vaut 1 maintenant...


# analyser l'environnement
ls(environment(cube))
get("n",environment(cube))

ls(environment(square))
get("n",environment(square))

# Lexical scoping vs Dynamic Scoping
y <- 10
f <- function(x){
  y<-2
  y^2+g(x) # g def dans le glob evt
}

g <- function(x){
  x*y # y est def dans le global evt et vaut 10
}

f(3)

get("y",environment(f))
get("y",environment(g))





# dynamic scoping : se serait l'environnement appelant (parent frame) qui compte donc y =2

# NB si evt d'appel et de def estle meme
k <- 3

g <- function(x) {
  a<-3
  x+a+k
}

g(2)
k<-2
g(2)

# attention k est defini dans l'environnement de def qui est le meme que celui de l'appel

# Lexical scoping : Perl, Python, Common Lisp

# La consequence est que tous les objets doivent etre stockes en memoire.
# Chaque fonction doit maintenir unpointeur vers son environement de definition

# ----------------------------------------------------------
# Week2 : Scoping Rules - Optimization exemples
# ----------------------------------------------------------

# optim, nlm, optimize
# passer une fonction dont l'argument est un vecteur de parametres

# Par exemple les min ou max dependent non seulement des param
# mais aussi des data
# certains parametres sont fixes.. 

# Creer un constructeur de fonction qui construit la fonction objectif
# donc toutes les donnees dans le defining evt...
make.NegLogLik <- function(data, fixed=c(FALSE,FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5*length(data)*log(2*pi*sigma^2)
    b <- -0.5*sum((data-mu)^2) / (sigma^2)
    -(a+b)
  }
}


set.seed(1); normals <- rnorm(100,1,2)
hist(normals)
nLL <- make.NegLogLik(normals)
nLL

ls(environment(nLL))

help(optim)
optim(c(mu=0,sigma=1),nLL)$par

# Fixing sigma = 2
nLL <- make.NegLogLik(normals, c(FALSE,2))
optimize(nLL, c(-1,3))$minimum

# Fixing mu = 1
nLL <- make.NegLogLik(normals, c(1,FALSE))
optimize(nLL, c(1e-6,10))$minimum


#?????

# ----------------------------------------------------------
# Week2 : Coding Standards
# ----------------------------------------------------------

# 1     Text editor & text file
# 2     Indentation (at least 4 evt 8)
# 3     Limit of the width (ex 80 col)
# 4     Limit of length of individual function


# ----------------------------------------------------------
# Week2 : Dates and times
# ----------------------------------------------------------

# "Date" class
# "POSIXct" (large int) "POSIXlt" (list) class for times 
# Dates nb of days since  1970 01 01
# Times nb of sec since  1970 01 01      


x <- as.Date("1970-01-01")
x
y <- as.Date("1971-12-06")
y
class(x)
unclass(x)
unclass(y)

unclass(as.Date("1970-01-02"))
unclass(as.Date("1971-01-02"))

# Times

# "Date", "POSIXct",  "POSIXlt"
weekdays(y)
months(y)
quarters(y)
julian(y)
?months()

class(months(y))

x <- Sys.time()
x
class(x) # "POSIXct" 

unclass(x) # entier ...nombre de sec depuis 01/01/1970

p <- as.POSIXlt(x)
p
class(p)
unclass(p)
names(unclass(p)) # list underliying

p$sec
p$yday
p$year

months(p)
quarters(p)

x <- Sys.time()
x
unclass(x)
class(x)

x$sec # ERR il faut d'abord convertir en POSIXlt...

# !!! dans la langue locale ....
datestring <- c("January 10, 2012 10:40","December 9, 2011 9:10")
datestring
help(strptime)
x <- strptime(datestring)
x
x <- strptime(datestring,"%B %d, %Y %H:%M")
x
class(x) # "POSIXlt"

datestring <- c("January 10, 2012 10:40")
x <- strptime(datestring,"%B %d, %Y %H:%M")
x
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21","%d %b %Y %H:%M:%S")
y
class(y) # "POSIXlt"
class(x) #"date"
x-y

x <- as.POSIXlt(x)
x-y
class(x-y)      # "difftime"

x <- as.POSIXct("2012-10-25 01:00:30")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
z <- y-x
class(z)        # "difftime"
z
unclass(z)


# ----------------------------------------------------------
# Week2 : Quiz
# ----------------------------------------------------------


cube <- function(x, n) {
        x^3
}

cube(3)         # lazy??

x <- 1:10
x>5

# Warning
# 'x' is a vector of length 10 and 'if' can only test a single logical statement.
if(x > 5) {
        x <-0
}
if(x < 5) {
        x <-0
}
x



f <- function(x) {
        z <- 30
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}

z <- 15
f(3)
# z vaut 4 dans l'environnement de definition de g
# meme si c'est plus tard dans le code



x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
y

# ----------------------------------------------------------
# Week2 : Quiz question 5
# ----------------------------------------------------------


h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}

# ----------------------------------------------------------
# Prepqrqtion assignment
# ----------------------------------------------------------

# ----------------------------------------------------------
# Conversion d'un id en nom de fichier
# ----------------------------------------------------------

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

length("acd")
nchar("toto") # Nombre de caractere d'une chaine



wd <- getwd()
id <- 1
directory <- paste(wd,"/","specdata", sep="")
file_name <- paste(directory,"/",convid(id), sep = "")
data1 <- read.table(file_name, T, ",")

id <- 2
directory <- paste(wd,"/","specdata", sep="")
file_name <- paste(directory,"/",convid(id), sep = "")
data2 <- read.table(file_name, T, ",")

data <- merge(data1,data2)
data <- data.frame(data1, data2)
data <- rbind(data1, data2)

help(rbind)
help(merge)
help(append)

id <- 1:2
id
for (i in id) {
        file_name <- paste(directory,"/",convid(i), sep = "")
        print("------------file name-------------")
        print(file_name)
        print("------------i------------")
        print(i)
        newdata <- read.table(file_name, T, ",")
        if (i==1) { 
                data <- newdata 
        } else {
                data <- rbind(data,newdata)
        }
}

pollutantmean <- function(directory, pollutant, id = 1:332, debug = FALSE) {
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
        
        # Boucle sur la s??quence d'indice
        for (i in id) {
                file_name <- paste(directory,"/",convid(i), sep = "")
                if (debug) {
                        print("File : ")
                        print(file_name)
                        print("i")
                        print(i)                        
                }
                newdata <- read.table(file_name, T, ",")

                if (i==id[1]) { 
                        data <- newdata 
                } else {
                        data <- rbind(data,newdata)
                }
                if (debug) {
                        print("Taille : paquet i")
                        print(nrow(newdata))
                        print("Taille totale : ")
                        print(nrow(data))
                }
        }
        
        # Calcul de la moyenne
        if (pollutant=="sulfate") {
                mean = mean(data$sulfate, na.rm = TRUE)
                if (debug) {
                        print("sulfate")
                 }
        } else if (pollutant=="nitrate") {
                if (debug) {
                        print("nitrate")
                }
                mean = mean(data$nitrate, na.rm = TRUE)
        }
        # pas possible de faire data$pollutant...
        mean
}



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

