# ----------------------------------------------------------
# Week3 : Loop functions - lapply
# ----------------------------------------------------------

# lapply :      loop over a "l" list of object and evaluate a function on each elements
# sapply :      idem but to simplify the result
# apply :       Apply a function over the margins of an array
# tapply :      Apply a function over subset of a vector
# mapply :      "m" Multivariate version of lapply

# split

# lapply args x list ou obj convertible ne liste FUN function (or the name of a function) 
# (3) ...
# if x is not a list it will be coerced as a list using as.list...

lapply

x <- list(a= 1:5, b = rnorm(10))
x
lapply(x,mean)
# returns a list always

x <- list(a= 1:5, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
x
lapply(x,mean)
# names are preserved

x <- 1:4        # vector de longueur 4
x
as.list(x)
help(runif)
runif(4)        # runif(x) genère x valeur entre 0 et 1 uniforme distri
class(runif(4))
lapply(x,runif) # x est converti en liste avec as.list(x)...

l <- list(a=1,b=2,c=3,d=4)
l
lapply(l,runif) # lapply parcour la liste et applique runif a chaque elt

#       Param ... ellipse
lapply(x,runif, min = 0, max = 10) #    ... les autres arguments de la fonction
str(lapply)

x
lapply(x,paste, "aaa","bbb","qqq","ccc") #    ... les autres arguments de la fonction
str(lapply)
str(paste)
l
lapply(l,paste, "aaa","bbb","qqq","ccc") #    ... les autres arguments de la fonction


# "Anonymous functions" qui n'ont pas de nom


lm <- list(a = matrix(1:4 ,2,2), b = matrix(1:6, 3, 2))
lm

lapply(lm,function(elt) elt[,1])
lapply(lm,function(elt) elt[,1,drop = FALSE])

# -------------------------------------------------------------
# sapply will try to simplify the result of lapply if possible
# if the  result is a list where every elt is length 1 , then a vector is returned
# if the result is a list where every elt is a vector of the same length >1 , then a matrix is returned
# if it can't figure things out, a list is returned

x <- list(a= 1:5, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
x

lapply(x,mean)  #       Retourne une liste de "numeric" de longueur 1
class(lapply(x,mean))

sapply(x,mean)  #       Retourne un vecteur avec names
class(sapply(x,mean))


# ----------------------------------------------------------
# Week3 : apply
# ----------------------------------------------------------

# for function to be applied to the row or column of a matrix
# not faster than loop but 1 line code..

# An array is a vector that has dim attached in it
# matrix is an array with 2 dim

# Arguments : x "array", 
# MARGIN "interger" vector indicating which margins should be retained
# FUN "function", ...

str(apply)
# function (X, MARGIN, FUN, ...)  

x <- matrix(rnorm(200),20, 10)
x
apply(x, 2, mean)       # preserve dim 2 ie colonnes collapse ligne
apply(x, 1, sum)        # preserve lignes clollapse colonnes


# for sums and means of matrix dimensions, optimized functions:
str(rowSums)
rowSums(x)
apply(x,1,sum)
y <- apply(x,1,sum)
class(y)
length(y)

rowMeans(x)
apply(x,1,mean)

colSums(x)
apply(x,2,sum)

colMeans(x)
apply(x,2,mean)

# --------------------------------------------
help(quantile)
str(quantile)
apply(x,1,quantile, probs = c(0.25,0.75)) # preserve les lignes, calcule sur les colonnes
y <- apply(x,1,quantile, probs = c(0.25,0.75))
dim(y)
# retourne une matrice 2*20...

# -------------------------------------------------------
# Array

b <- array(rnorm(200),c(4,10,5))
class(b)
attributes(b)
a <- array(rnorm(2*2*10), c(2,2,10))
class(a)
attributes(a)
# Dimension 3

apply(a, c(1,2), mean) # preserve les dim 1 et 2, calcule sur la 3

rowMeans(a, dims =2) # ??? pas simple de comprendre le 2
rowMeans(b, dims =2) # dims = 2 dimensions are regarded as ‘rows’ or ‘columns’ to sum ove ...bof
help(rowMeans)

apply(a, 1, mean) # preserve les dim 1  calcule sur la 2x3

apply(b, c(1,2), mean) # preserve les dim 1 et 2, calcule sur la 3
apply(b, 1, mean) # preserve les dim 1 calcule sur la 2 x 3
apply(b, c(1,2,3), mean) # preserve les dim 1,2 et 3 calcule les elts ... donc b
b

c <- array(rnorm(2*2*2*10), c(2,2,2,10))
dim(c)
y <- apply(c,c(1,2,3), mean) # garde les dim 1,2,3 et somme sur la 4
y
class(y)
dim(y)


# ----------------------------------------------------------
# Week3 : mapply
# ----------------------------------------------------------
# Multivariable function...
str(mapply)

# FUN, ...,
# si liste 1 et liste 2 avec pour arg 1 et arg 2
x <- 1:4
y <- 6:9
mapply(function(a,b) a+b, x,y)
# cohérence entre le nombre d'argument de ka fonction et le nombre de liste

rep(1:4)
help(rep)
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1)     # rep prend deux arguments... donc deux listes

noise <- function(n,mean,sd) {
        rnorm(n,mean,sd)
}
y <- noise(5,1,2)
mean(y)
sd(y)
y


noise(1:5,1:5,2) # bof

# 1 random with mean 1, 2 rm with mean 2, ...
mapply(noise, 1:5, 1:5, 2)
mapply(noise, 1:5, 3, 2)

# vectoriser une fonction, ...qui n'admet pas les vecteurs en arg
# idem
list(noise(1,1,2), noise (2,2,2),noise(3,3,2), noise(4,4,2),noise(5,5,2))


# ----------------------------------------------------------
# Week3 : tapply
# ----------------------------------------------------------
str(tapply)
# Apply a function on a subset of a vector
# X vector
# INDEX même taille factor ou liste de facor ou convertible en factor 
# FUN

hist(runif(10000))
hist(rnorm(10000))
hist(rnorm(10000,1))

x <- c(rnorm(10), runif(10), rnorm(10,1))
x
f <- gl(3,10) # generate factors by specifying the pattern of their levels
f
class(f)
levels(f)
help(gl)

tapply(x,f,mean)
help(tapply)
# x atomic object.. ex vector
# index : list of one or more factors, each the same length of x

tapply(x,f,mean, simplify = FALSE)

tapply(x,f,range)

f2 <- gl(2,15) # generate factors by specifying the pattern of their levels
f2

l <- list(f,f2)
l

tapply(x,l,mean, simplify = FALSE)


# ----------------------------------------------------------
# Week3 : split
# ----------------------------------------------------------

x <- 1:30   # Vector or dataframe
f <- gl(3,10)   # Factor ou objet convertible en factor avec as.factor
# split retourne la liste de vecteur ou dataframe correspondant
# aux levels du factor 

help(split)
str(split)
split(x,f)


lapply(split(x,f),mean) # on peut ensuite applique lapply ou sapply à la liste

library(datasets)
head(airquality)


# exemple calculer la moyenne pour chaque mois...
nrow(airquality)
table(airquality$Month)
class(airquality$Month)
as.factor(airquality$Month)
class(factor(airquality$Month))

tapply(airquality$Ozone,airquality$Month,mean, na.rm = TRUE)
str(tapply)

s <- split(airquality,airquality$Month)
s # liste de data frame... 1 pour chaque mois
lapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")], na.rm = TRUE))



# Spliting more than one level
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
f1
f2
class(f1)
interaction(f1,f2)      # construit un factor intersection
class(interaction(f1,f2))


y <- split(x, list(f1,f2))
y
str(split(x, list(f1,f2)))

y <- split(x, list(f1,f2), drop = TRUE) # supprime les levels non utiles
y

# ----------------------------------------------------------
# Week3 : Debugging
# ----------------------------------------------------------

# Message / Warning / Error / Condition

# message() warning() function
# stop() function
str(message)
str(warning)
str(stop)
warning()

# conditions : generic concept... nouvelles peuvent être créées
# ex mess war err conditions...

# Warning
log(-1)

printmessage <- function(x) {
        if (x>0)
                print("x is > 0")
        else
                print("x < 0")
        invisible(x)    # prevent autoprinting
}

help(invisible) # Return a (temporarily) invisible copy of an object
y <- printmessage(10)
y

printmessage(10)
printmessage(NA)



printmessage2 <- function(x) {
        if (is.na(x))
                print("x missing")
        else if (x>0)
                print("x < 0")
        else
                print("x < 0")
        invisible(x)    # prevent autoprinting
}

# ----------------------------------------------------------
# Week3 : Debugging Tools in R
# ----------------------------------------------------------

# traceback : print out the function call stack after an oerr occur

# debug : flag a function for "debuging" mode one line at a time
# broser 
# trace
# recover


# traceback()
# à appeller juste après l'erreur....
z
mean(z)
traceback()

lm(x~y)
traceback()

debug(lm) # possible d'appeller aussi à l'intérieur du debugeur
lm(x~y)

undebug(lm)
lm(x~y)


# recover

#options(error = recover)
read.csv("nosuchfile")

# ----------------------------------------------------------
# Week3 : Quizz
# ----------------------------------------------------------

library(datasets)
data(iris)
?iris
iris
class(iris)
attributes(iris)
names(iris)
nrow(iris)
summary(iris)
class(iris$Species)
levels(iris$Species)
class(iris$Sepal.Length)
class(iris$Sepal.Width)
class(iris$Petal.Length)
class(iris$Petal.Width)

sum(complete.cases(iris)) == nrow(iris)
# Pas de valeur manquantes

# ----------------------------------------------------------
# Week3 : what is the mean of 'Sepal.Length' for the species virginica?
# ----------------------------------------------------------

# première methode
mean(iris$Sepal.Length[iris$Species == "virginica"], na.rm = TRUE)

# methode avec split et lapply
s <- split(iris, iris$Species)
s
str(lapply)
lapply(s, function(x) mean(x[,"Sepal.Length"], na.rm = TRUE))

# ou bien avec sapply
sapply(s, function(x) mean(x[,"Sepal.Length"], na.rm = TRUE))

# ou bien juste sur le 3 eme element de la liste s
s$virginica
s$virginica$Sepal.Length
mean(s$virginica$Sepal.Length, na.rm = TRUE)


# Deuxième methode avec vecteur et tapply

str(tapply)
iris$Sepal.Length # vecteur
iris$Species # factor
r<- tapply(iris$Sepal.Length,iris$Species, mean, na.rm = TRUE)
r
r["virginica"]

# ----------------------------------------------------------
# Week3 : what R code returns a vector of the means of the variables 
# 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
# ----------------------------------------------------------
str(apply)
apply(iris[,1:4], 2,mean)
colMeans(iris[,1:4])

apply(iris, 2,mean)
colMeans(iris)
rowMeans(iris[,1:4])


# ----------------------------------------------------------
# Week3 : average miles per gallon (mpg) by number of cylinders in the car (cyl)
# ----------------------------------------------------------


library(datasets)
data(mtcars)
head(mtcars)

sum(complete.cases(mtcars)) == nrow(mtcars)

?mtcars
# methode 1
tapply(mtcars$mpg, mtcars$cyl, mean)
# methode 2
s <- split(mtcars, mtcars$cyl)
s
sapply(s,function(x) mean(x[,1]))


lapply(mtcars, mean) # data frame vu comm une liste de col
split(mtcars, mtcars$cyl) # split en 3 data frame selon cyl
sapply(mtcars, cyl, mean) # ERR


# ----------------------------------------------------------
# Week3 : what is the absolute difference between the average horsepower 
# of 4-cylinder cars and the average horsepower of 8-cylinder cars?
# ----------------------------------------------------------
r <- tapply(mtcars$hp, mtcars$cyl, mean)
r
r["8"]-r["4"]

debug(ls)

ls()
undebug(ls)

library(swirl)
swirl()

#----------------------------------------------------------
# Swirl 10: lapply and sapply 
# ----------------------------------------------------------
# concise and convenient means of implementing the
# Split-Apply-Combine strategy for data analysis

# UCI Machine Learning Repository
# http://archive.ics.uci.edu/ml/datasets/Flags

#dput(flags, file="flags.R")
flags <- dget("flags.R")

head(flags)
dim(flags)

cls_list <- lapply(flags, class)
cls_list

as.character(cls_list)

cls_vect <- sapply(flags, class)
class(cls_vect)

sum(flags$orange)
flag_colors <- flags[, 11:17]

head(flag_colors)

sapply(flag_colors,sum)

sapply(flag_colors,mean)

flag_shapes <- flags[,19:23]

lapply(flag_shapes,range)

shape_mat <- sapply(flag_shapes,range)

class(shape_mat)

unique(c(3, 4, 5, 5, 5, 6, 6))

unique_vals <- lapply(flags,unique)

sapply(unique_vals,length)

lapply(unique_vals, function(elem) elem[2])

#----------------------------------------------------------
# Swirl 11: vapply and tapply 
# ----------------------------------------------------------

viewinfo()

# vapply() allows you to specify format explicitly

vapply(flags, unique, numeric(1))

sapply(flags, class)
vapply(flags, class, character(1))

# vapply() may perform faster than sapply() for large datasets


table(flags$landmass)
table(flags$animate)

tapply(flags$animate, flags$landmass, mean)
tapply(flags$population, flags$red, summary)
tapply(flags$population, flags$landmass, summary)


#----------------------------------------------------------
# Swirl 12: Looking at Data
# ----------------------------------------------------------
# We'll be using a dataset constructed from the United States
# Department of Agriculture's PLANTS Database
# (http://plants.usda.gov/adv_search.html).

# dput(plants, file="plants.R")
plants <- dget ("plants.R")

class(plants)
dim(plants)
nrow(plants)
ncol(plants)
object.size(plants) # donne la taille en mémoire
names(plants)
head(plants)
head(plants,10)
tail(plants,15) # les 15 dernieres lignes
summary(plants)

table(plants$Active_Growth_Period)

str(plants)

#----------------------------------------------------------
# Swirl 13: Simulation
# ----------------------------------------------------------
# tools for simulating random numbers

?sample
sample(1:6, 4, replace = TRUE)
sample(1:20, 10)
LETTERS
sample(LETTERS) # permutations

flips <- sample(c(0,1),100, replace = TRUE,prob = c(0.3, 0.7))
sum(flips)

# Binomial Distribution
?rbinom


# Each probability distribution in R has an r*** function (for "random"), a d***
# function (for "density"), a p*** (for "probability"), and q*** (for "quantile"). We
# are most interested in the r*** functions

rbinom(1, size = 100, prob = 0.7)
# you only specify the probability of 'success' 
# (heads) and NOT the probability of 'failure' (tails)

flips2 <- rbinom(100, size = 1, prob = 0.7)


?rnorm
rnorm(10)
rnorm(10, mean = 100, sd = 25)


?rpois # Poisson Distribution
rpois(5, 10)
my_pois <- replicate(100, rpois(5, 10))
# replicate() created a matrix, each column of which contains 5 random numbers

cm <- colMeans(my_pois)

hist(cm)
#  the Central Limit Theorem ..

#----------------------------------------------------------
# Swirl 14: Dates and Times
# ----------------------------------------------------------

d1 <- Sys.Date()
class(d1)
unclass(d1)
d2 <- as.Date("1969-01-01")
unclass(d2)

t1 <- Sys.time()
t1
class(t1)
unclass(t1)

t2 <- as.POSIXlt(Sys.time())
class(t2)
unclass(t2)
str(unclass(t2))
t2$min

# pour les 3 types...
weekdays(d1)
months(t1)
quarters(t2)

t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
t4

Sys.time() > t1

Sys.time() - t1

difftime(Sys.time(), t1, units = 'days') # pour préciser les unités

# si beaucoup date, ...check out the lubridate package by Hadley Wickham

#----------------------------------------------------------
# Swirl 15: Base Graphics
# ----------------------------------------------------------

# reate publication-quality graphics
# See http://varianceexplained.org/r/teach_ggplot2_to_beginners/
# not ... lattice, ggplot2 and ggvis

data(cars)
?cars
head(cars)
# dput(cars, file="cars.R")
cars <- dget("cars.R")

# Note that 'plot' is short for scatterplot

?plot
plot(x = cars$speed, y = cars$dist)

# The formula interface
plot(dist ~ speed, cars)

plot(y = cars$speed, x = cars$dist)

plot(x = cars$speed, y = cars$dist, xlab="Speed")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")

plot(x = cars$speed, y = cars$dist, xlab="Speed", ylab = "Stopping Distance")

plot(cars, main = "My Plot")
plot(cars, sub = "My Plot Subtitle")

?par

plot(cars, col = 2) # couleur rouge
plot(cars, xlim = c(10, 15))

?points
plot(cars, pch = 2 )

# any/most people use more modern packages, like ggplot2, for
# creating their graphics in R

data(mtcars)

# dput(mtcars, file="mtcars.R")
mtcars <- dget("mtcars.R")

?boxplot

hist(mtcars$mpg)
# next study the ggplot2 package
# (http://www.ling.upenn.edu/~joseff/rstudy/week4.html)
