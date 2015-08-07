# setwd("~/Dropbox/Datascience") set working directory
getwd() # Get working directory 
source("myfunction.R")

dir("~/Dropbox/Datascience") # donne les fichiers du "directory" / repertoire sp??cifie 
length(dir("~/Dropbox/Datascience"))
dir() # ou du working directory par d??faut
class(dir())

# ls donne les objets R en m??moire 
ls()  # retourne un vecteur avec le nom de objets
nb.objets <- length(ls())
nb.objets

myfunction()
second(4)
second(4:10)

# ----------------------------------------------------------
# R console Input and Evaluation
# ----------------------------------------------------------
# Expressions R, par exemple : "x <- 1"
x <- 1  # <- assignment operator 
print(x)  # Functin print()
x # sans appeller la fonction print...nom de l'objet -> "auto printing"
# x is a R object "numeric" , c'est un vecteur "numeric" de "length" 1   
class(x)  
length(x)

msg <-  "hello" # Vecteur "character" premier elt "hello"
# les autre elements devront ??tre aussi des character
print(msg)
msg
class(msg)
length(msg)

# Explicit printing or auto printing


# Une expression est evaluee et le resultat de l'expression evaluee est retournee

# Creation de sequences
x <- 1:20
x
class(x)  
length(x)
# x est un vecteur de "class" "integer" de "lenght" 20

# ----------------------------------------------------------
# Data types : Objects and attributs
# ----------------------------------------------------------
# 5 classes de base d'objet : 
# "character", 
# "numeric", r??els double sur 8 bit, Inf et NaN
# "integer", 
# "complex", nombres complexes
# "logical", TRUE ou FALSE (ou NA....)

vector()
vector(mode = "logical", length = 2)
v <- vector(mode = "logical", length = 2)
v <- vector("logical", 2)
v
class(v)
v <- vector(mode = "complex", length = 2)
v
class(v)

v <- vector(mode = "numeric", length = 20)
v

# 1 traite par defaut en reel double...
# sauf si explicitement specifie par suffixe "L" : 1L
1
1L
1/0 # donne Inf
0/0 # donne NaN not a number...
class(1)
class(1L)
class(1/0)
class(0/0)
class(Inf)
class(NaN)
class(NA)       # "logical" bof... d??pend peut ??tre de n'importe quel type
# Attributs
# names, dimnames, dim, class, length...
y <- cbind(a = 1:3, pi = pi) # combine les colonnes ... pour creer matrix with dimnames
y
attributes(y)
class(y)
class(x)
length(x)
length(y) # donne le nombre total d'??l??ments

# ----------------------------------------------------------
# Vecteurs et listes 
# ----------------------------------------------------------
# function c() autre fonction pour creer des vecteurs
# c comme concatenate
x <- c(0.5, 0.6)      ##  numeric vector
x
class(x)
x <- c(TRUE, FALSE)   ##  Logical vector
x
class(x)
x <- c(T,F)           ##  Logical vector
x
class(x)
x <- c("a","b","c")   ##  Character vector
x
class(x)
x <- 2:15             ##  Integer vector
x
class(x)
x <- c(1+0i,2+4i)     ##  Complex vector
x
class(x)
x <- vector("numeric", length = 10) # Initialise avec des valeurs par defaut
x
class(x)
# conversion par defaut ...implicite
y <- c(1.7, "a")      ##  Character vector
y
y <- c(TRUE, 2)       ##  Numeric vector (TRUE converti en 1 et FALSE en 0)
y
class(y)
y <- c(TRUE, 2L)       ##  Integer vector (TRUE converti en 1 et FALSE en 0)
y
class(y)
y <- c(2, F)          ##  Numeric vector.... idem T converti en 1 F en 0
y
class(y)
y <- c("a", TRUE)     ##  Character vector
y
y <- c("a", T)        ##  Character vector.... idem T converti en "TRUE"
y
y <- c("a", 2+3i, T)        ##  Character vector.... idem T converti en "TRUE" et les nombre complexes en chaine
y
y <- c(2+3i, 1)        ##  Complex vector.... 1  converti en  nombre complexes 
y
class(y)
y <- c(2+3i, T)        ##  Complex vector.... 1  converti en  nombre complexes 
y
class(y)
y <- c("1", 2, T)        ##  Character vector.... idem T converti en "TRUE" et les nombre complexes en chaine
y

y <- c("1", 2)        ##  Character vector.... idem T converti en "TRUE" et les nombre complexes en chaine
y
class(y)

# En r??sum?? ..... character gagne sur complex, numeric, interger, logical
# ............... complex gagne sur numeric, interger, logical
# ............... complex gagne sur interger, logical
# ............... interger gagne sur logical


# conversion explicite
x <- 0:6
class(x)
y <- as.numeric(x)
y
class(y)
as.logical(x) # 0 est converti en FALSE, les autres valeurs en TRUE
as.character(x)
as.complex(x) # partie imaginaire a 0

x <- c("a","b","c")
x
as.numeric(x) # NAs...
class(as.numeric(x))

x <- c("1","2","3")
x
y <- as.numeric(x) # 1,2,3..
y
class(y)

y <- as.integer(x) # 1,2,3..
y
class(y)


# donc "1",1 -> conv implicite 1,1 mais "1" peut ??tre explicitement conv en 1

# les listes peuvent contenir des objets de classes diff??rentes
x <- list(1,"a",TRUE,1+3i)
x
class(x)  # Class "list"
attributes(x)
names(x)
x <- list(1,"a",TRUE,1+3i,F,3,"text")
x
names(x) <- c("a","b","c","d","e","f","g")
x
attributes(x)
names(x)

# c'est une liste de vecteurs

# ----------------------------------------------------------
# Matrices 
# ----------------------------------------------------------
# Vecteurs avec un attribut dimension

m <- matrix(nrow = 2, ncol = 3)
m
dim(m)    # attribut dim vecteur de longueur 2 dont le premier elt est le nb de ligne et le 2 col
x <- 2:15  
dim(x)
attributes(m) # renvoi une liste dont le premier elt est dim...
attributes(x)

# les matrices sont construite par colonnes....
m <- matrix(1:6, nrow = 2, ncol = 3)
m


# ----------------------------------------------------------
# creation de matrice a partir d'un vecteur 
# en creant l'attribut dimension au vecteur
m <- 1:10
m
class(m)
dim(m) <- c(2,5)  # 2*5 = 10...  par colonnes
m # c'est donc bien un vecteur avec un attribut dim...
class(m)  # la classe devient "matrix" avec l'ajout de l'attribut dim
attributes(m)
dim(m)


m <- 1:20
m
class(m)
dim(m) <- c(2,5,2)  # 2*5*2 = 20...  par colonnes
m # c'est donc bien un vecteur avec un attribut dim...
class(m)  # la classe devient "array" avec l'ajout de l'attribut dim de length > 2
attributes(m)
dim(m)
# ----------------------------------------------------------
# creation de matrice par combinaison de ligne ou colonnes
x <- 1:3
y <- 10:12
x
y

cbind(x,y)  # column-binding
rbind(x,y)  # row-binding

ycol <- cbind(x,y)  # column-binding
yrow <- rbind(x,y)  # row-binding


class(ycol)
class(yrow)
attributes(ycol) # noter que les nom des colonnes sont les noms des vecteurs ayant servi...
attributes(yrow) # noter que les nom des lignes sont les noms des vecteurs ayant servi...
# ----------------------------------------------------------
# Factors 
# ----------------------------------------------------------
# cas special de vecteur...
# Pour representer des donnees categorielles
# 2 types : ordonne ou non ordonne ?

# similaire a un vecteur d'entier pour lesquel les entiers ont des noms

# Creation a partir de la fonction factor() avec un vecteur de caractere en argument
x <- factor(c("yes","yes","no","yes","no"))
x
class(x)
attributes(x)
# noter pas printout comme un veecteur carac ::: pas les ""...les val.. et l'attribut levels
levels(x)
class(x)
table(x)  # function table() avec un factor en argument donne le nb de chaque level
unclass(x)
# Il s'agit donc bien d'un vecteur d'entier avec attribut levels
attributes(x)

x <- factor(c(10,12,14,12,10))
x
class(x)
attributes(x)
levels(x)
class(levels(x)) # idem .... levels sont des caract??res
table(x)  # function table() avec un factor en argument donne le nb de chaque level
unclass(x)



x <- factor(c("yes","aaa","abaaa","zz","zz"))
x
table(x)
attributes(x)
levels(x)
unclass(x)
# par defaut classement des levels par ordre alphab... et codage 1,2,3...
z <- c("yes","aaa","abaaa","zz","zz")
z
class(z)
levels(z) <- c("aaa","abaaa","yes","zz")
z
class(z) # reste un vecteur de caractere!!!!!
class(z) <- "factor" # ERROR
z
class(z)

z <- factor(z)
class(z)

# Pour ordonner les niveaux
x <- factor(c("yes","yes","no","yes","no"), levels = c("yes","no"))
x
unclass(x)  # noter le codage ...
# Baseline level : le premier.... important in linear modeling


# ----------------------------------------------------------
# Missing Values 
# ----------------------------------------------------------
# NaN "not a number" for undefined math values or NA for the rest
0/0
is.na(1)
is.na(0/0)  # retourne un vecteur...
is.nan(0/0)
class(0/0)
m <- matrix(nrow = 2, ncol = 3)
m
is.na(m)  # retourne un matrice...
is.nan(m)
# NaN est aussi NA mais pas l'inverse...

x <- c(1,2,NA,10,3)
x
is.na(x)
is.nan(x)
x <- c(1,2,NaN,10,3)
x
is.na(x)
is.nan(x)
x <- c(1,2,NA,10,3,0/0,1/0)
x
is.na(x)
is.nan(x)

# ----------------------------------------------------------
# Data Frames 
# ----------------------------------------------------------
# special type of list..(les listes sont des liste de vecteurs).. chaque elt de m??me taille
# liste de vecteur colonnes.. toute de taille nb de ligne.. de type diff (integer, factor, charac...)
# Un attribut special row.names
# Chaque ligne a un nom...(unicite???)

# Creation par read.table() ou read.csv()

# Peuvent ??tre converties en matrice avec data.matrix() mais conversion....type unique...

x <- data.frame(foo = 1:4, bar = c(T,F,T,F))
x
class(x)  # Class "data.frame"
attributes(x) # class, names, row.names
nrow(x)
ncol(x)
row.names(x)
names(x)


unclass(x) # est une liste ?? la base

# ----------------------------------------------------------
# Names attributes Frames 
# ----------------------------------------------------------

x <- 1:3
names(x)
names(x) <- c("foo","bar","norf")
x
names(x)
class(x)

x <- list(a=1,b=2,c=3)
x
attributes(x)
x <- list(1,2,3)
attributes(x)
names(x) <- c("a","b","c")
x

m <- matrix(1:4, nrow = 2, ncol = 2)
m
attributes(m)
dimnames(m) <- list(c("a","b"), c("c","d"))
m
attributes(m)
dimnames(m)
class(dimnames(m))
class(m)

# ----------------------------------------------------------
# Reading Tabular Data 
# ----------------------------------------------------------

# read.table()
# read.csv()
alc2 <- read.csv2("alcool.csv")
alc <- read.csv("alcool.csv")
alc3 <- read.table("alcool.csv")
# Retournent des dataframes
vl <- readLines("myfunction.R") # Lire les lignes d'un texte
vl
length(vl)
vl[2]
# Renvoit un vecteur de caractere
source("myfunction.R")  # Pour lire du code R pas seult des fonctions

# dget()    # R code dparsed ???? into text files

# load()
# unserialize() 
# reading binary objects into R


# Pour ecrire... write.table(), writeLines(), dump, dput, save, serialize


alc4 <- read.table("alcool.csv", T, ";")  # file name, header T/F, separateur
summary(alc4)
class(alc4)
attributes(alc4)
nrow(alc4)
ncol(alc4)
names(alc4)
class(alc4$t)           # "integer"
class(alc4$SEVRE)       # "integer"
class(alc4$AGE)         # "integer"
class(alc4$SEXE)        # "integer"
class(alc4$EDVNEG)      # "integer"

alc4 <- read.table("alcool.csv", T, ";",colClasses = c("numeric","factor","numeric","factor","factor"))

class(alc4$t)           # "numeric"
class(alc4$SEVRE)       # "factor"
class(alc4$AGE)         # "numeric"
class(alc4$SEXE)        # "factor"
class(alc4$EDVNEG)      # "factor"


# Arguments : 
# file, header (logical), sep (defaut " " val "," ";"), colClasses (facultatif vecteur carac avec les class des colonnes)
# nrows (facultatif), comment.char ("$"..."#" pour que soit ignor?? les carac ?? droite), skip (nb lignes a skipper)
# stringAsFactor (defaut TRUE pour coder les character en factor sinon FALSE)

# read.csv() "," separateur par d??faut

# ----------------------------------------------------------
# Reading Large Dataset 
# ----------------------------------------------------------
help(read.table)
# Estimer la m??moire necessaire pour voir si OK (R fonctionne en m??moire)

# Set comment.char""
# Renseigner colClasses (much faster)

# Quick and dirty way eventuellement
initial <- read.table("alcool.csv", T,";",nrows = 10)
classes <- sapply(initial, class) # applique class ?? la liste que constitue le data.frame 
classes
tabAll <- read.table("alcool.csv", T,";", colClasses = classes)

# mieux
classes <- c("integer","factor","integer","factor","factor")
classes
tabAll <- read.table("alcool.csv", T,";", colClasses = classes)

nrow(tabAll)
databis <- read.table("alcool.csv", T,";",nrows = 200)
nrow(databis) #s'arr??te avant...

# set nrows mieux pour optim la m??moire. peut ??tre surestim??

# Connaitre m??moire disponible, ... OS ... 32 or 64 bit

# Ex. calc 1.500.000 rows 120 column
# 1.500.000*120*8 bytes/num
# 1440000000 bytes / 2puis20 bytes / MB donne 1.373.29 MB = 1.34 GB


# Les doubles utilisent 8 octets (de 8 bits) en m??moire
# en supposant que les elements ont cette taille...
# 1.500.000 * 120 * 8 octets
# 1 GB Gigabytes ou Gigaoctet = 10 puissance 9 octet (ou en fait 2 puissance 20)
# 1.500.000*120*8 / 1.000.000.000 # 1,5 GB (1,34 en fait)

# Considerer un facteur 2 necessaire soit 2,7 GB...

# ----------------------------------------------------------
# Textual Data Format 
# ----------------------------------------------------------

# dump() dput()
# metada ... info sur la nature des obj, ...

# dput() et dget() pour un Objet R

y <- data.frame(a=1, b = "a")
y
dput(y)
dput(y, file="y.R")
new.y <- dget("y.R")
new.y
dput(alc4, file="alc4.R")
alc5 <- dget("alc4.R")
summary(alc5)


# dump()
# peut ??tre utiliser pour multiple R object contrairement ?? dput
# ?? passer sous forme de vecteur avec les noms

dump(c("alc4","y"),file = "data.R")
source("data.R")

ls()
dump(ls(),file = "dataAll.R") # Stocke tous les objets de l'environnement...
source("dataAll.R")

# ----------------------------------------------------------
# Connections: Interface to the Outside World 
# ----------------------------------------------------------
help(url)

#file() opens a connection to a file
#gzfile ... file compressed with gzip
#bzfiles........bzip2
#url open a connection to a web page

# Arguments :
# file name
# open "r" read only "w" writing, "a" appending, 
#     "rb","wb","ab" reading writing or appending in binary mode (Windows)
# blocking
# encoding
# raw
str(file)

con <- file("alcool.csv","r")
data <- read.csv2(con)
close(con)

# si lecture partielle ???
con <- file("alcool.csv","r")
x <- readLines(con, 10)
close(con)
x
# writeLines() takes a caracter vector and write each element one line at a time to a text file

con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)
close(con)

con <- url("http://fr.investing.com/rates-bonds/euro-oat", "r")
y <- readLines(con)
head(y)
close(con)


# ----------------------------------------------------------
# Subsetting R Objects: Basics
# ----------------------------------------------------------
# [, [[, $
# [], retourne un objet toujours de m??me class que l'original
# vector -> vector, list -> list (une execption "matrix" et "data.frame")
# [[]] used to extract a single elements from a list or a data frame
# $ used to extract elements of a list or a datafra??e by names

x <- c("a","b","c","d","e","f")
x
x[1]
x[[1]] # ??
x[1:4]
x[2:3]    # Numeric index
x[x >"b"] # Logical index
u <- x > "a"  # donne un vecteur logique ...
u
x[u]      # dont on peut se servir pour indexer x
#   Deux type d'indice : num??rique ou logique

x <- 10:17
x
names(x) <- c("a","b","c","d","e","f","g")
x
names(x) <- c("a","b","c","d","e","f","g","h")
x
class(x)
x["e"]
class(x["e"])
x$e # ERROR.... $ operator is invalid for atomic vectors

# ----------------------------------------------------------
# Subsetting R Objects: Lists
# ----------------------------------------------------------

x <- list(1:4, 0.6)
x
x[1] # donne la liste compos??e de l'element 1
class(x[1])
x[[1]] # donne l'element 1 donc  vecteur integer
class(x[[1]])
x[[2]] # donne l'element 2 donc  vecteur numeric
class(x[[2]])

x <- list(foo = 1:4, bar = 0.6)
x
x[1] # donne la liste compos??e de l'element foo
class(x[1])
x[2] # donne la liste compos??e de l'element foo
class(x[2])

x[[1]] # donne l'element 1 donc  vecteur integer
class(x[[1]])
x$bar # donne l??l??ment bar donc vecteur numeric
class(x$bar)
x[["bar"]] # donne l'element "1"bar" donc  vecteur integer
x[[2]] # donne l??l??ment 2 donc vecteur numeric
class(x[[2]])

x$foo # donne l'element foo
x["foo"] # donne une liste de l'element foo
class(x["foo"])

# Extraction d'??l??ments multiples
# seulement possibles avec [] operator.... pas [[]] ou $
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x
x[c(1,3)] # renvoit une liste
x[c("foo","baz")]
x[c(T,F,T)] # avec indexation logique
name <- "foo" # Dans le cas ou l'on passe par une variable [[]]
name
[name]
x[[name]]   # Renvoi l'??l??ment d'index la valeur de name...donc foo soit un vecteur integer 
x$name   # NULL
x$foo  # idem x[[name]] ou x[["foo"]]Pour utiliser le $ il faut un symbol "literal"
x[["foo"]]

x <- list(a = list(10, 12, 14), b = c(3.14,2.81),c = c("aa","bb"))
x
x[[c(1,3)]] # renvoie le 3 eme elt du 1 er elt de lq liste ...recursif?
x[c(1,3)] # renvoie une liste contenant la 1 et la 3 eme liste
x[[1]][[3]] # liste de liste donc ok renvoie elt3 de elt1
x[[c(2,1)]] # Renvoie le premier ??l??ment du deuxi??me ??l??ment de la liste
x[[2]][1] # liste de liste et vecteur donc ok
class(x[[2]])
class(x[[1]])

# ----------------------------------------------------------
# Subsetting R Objects: Matrix
# ----------------------------------------------------------

x <- matrix(1:6, 2, 3)
x
x[1,2]  # N?? ligne, N?? colonne
x[3] # etonnant renvoi l'element 3 de lamatrice vue comme un vecteur
x[6] # etonnant renvoi l'element 6 de lamatrice vue comme un vecteur

class(x[1,2]) # exception...renvoi un atomic vector et non une "matrix"!!

x[1,2, drop = FALSE]  # N?? ligne, N?? colonne
class(x[1,2, drop = FALSE]) # garde la class "matrix"

x[2,3]  # N?? ligne, N?? colonne
x[8,2]  # ERR
x[1,]   # Un vecteur
x[,1]   # Un vecteur...
x[,1, drop = FALSE]   # "Un vecteur"matrix...colonne
x[2, ,drop = FALSE]   # "Un vecteur"matrix...ligne

x[,]    # "matrix"
x[,1, drop = FALSE]  # Un vecteur...
x[1,1:2]      # vecteut
class(x[1,1:2]) # exception....!!
x[1,1:2, drop =FALSE]      # vecteut


x[[2,2]]  # N?? ligne, N?? colonne

x <- matrix(1:9, 3, 3)
x
x[1:2,1:2]  #
class(x[1:2,1:2]) # "matrix

# ----------------------------------------------------------
# Subsetting R Objects: Subsetting with names
# ----------------------------------------------------------

# Partial matching
x <- list(aardf = 1:5)
x$a
x$b
x$r
x$aa
x$aab

x[["a"]]
x[["a", exact = FALSE]]
x["a", exact = FALSE]
x[1]
x["aardf"]
x["aardf", exact = FALSE] # ERR... seulement pour op??rateur [[]]
# ----------------------------------------------------------
# Subsetting R Objects: Removing NA Values or missing values
# ----------------------------------------------------------

x <- c(1,2,NA,4, NA,5)
x
bad <- is.na(x)
bad
!bad
x[!bad] # Garde les valeur non NA

x <- c(1,2,NA,4,NA,5)
y <- c("a","b", NA, NA, NA, "f")
good <- complete.cases(x,y) # donne un vecteur logique ou les deux vecteur sont ok
good
x[good]
y[good]

# OK egalement sur les data frame pour garder les lignes completes
alc4[1:6,]
good <- complete.cases(alc4) # renvoi un vecteur logique avec les lignes complete en TRUE... 
good
alc4[good,][1:6,]


class(alc4) # "data.frame"
attributes(alc4) # class, names, row.names
names(alc4)
alc4[1,1]
alc4[[1,1]]
class(alc4[1,1]) # exception
class(alc4[[1,1]]) # 
alc4[1,1, drop=FALSE]
class(alc4[1,1, drop=FALSE]) # exception

alc4[1,]
class(alc4[1,])

alc4[1:2,1]
class(alc4[1:2,1])
alc4[1:2,1, drop=FALSE]
class(alc4[1:2,1, drop=FALSE])

alc4[1:5,"t"]
class(alc4[1:5,"t"])
alc4[1:5,"t",drop=FALSE]
class(alc4[1:5,"t",drop=FALSE])


alc4[1:5,c("t","AGE")]
class(alc4[1:5,c("t","AGE")])

tinf <- alc4[,"t"] < 20
alc4[tinf,]


ageinf <- alc4[,"AGE"] < 40
ageinf
alc4[ageinf,]

comb <- tinf & ageinf
alc4[comb,]

# ----------------------------------------------------------
# Vectorised Operations
# ----------------------------------------------------------
# evite les loop, etc

x <- 1:4
y <- 6:9
x+y
x > 2
x >= 2
y == 8
x * y
z <- 1:3
x+z # Warning - recyclkage partiel de z plus petit...
x/y

x <- matrix(1:4, 2,2) ; y <- matrix(rep(10,4),2,2)
x
y
x + y 
x * y # element-wise multiplication
x / y
x %*% y # Produit de deux matrices

# ----------------------------------------------------------
# SWIRL Statistic with Interactive R Learning dev at Johns Hopkins
# ----------------------------------------------------------

z <- c(1.1, 9, 3.14)
c(z,555,z)
abs(z) # op??ration vectoris??e
sqrt(z)
z^2
c(1, 2, 3, 4) + c(0, 10) # recyclage de vecteurs...
c(1, 2, 3) + c(1, 10) # warning...


# ----------------------------------------------------------
# Quizz Week 1 
# ----------------------------------------------------------

data <- read.csv("hw1_data.csv")
attributes(data)
summary(data)
nrow(data)
ncol(data)


# Question 11 : what are the column names of the dataset? 
names(data)

# Question 12 : Extract the first 2 rows of the data frame and print them to the console. 
# What does the output look like?
data[1:2,]

# Question 13 : How many observations (i.e. rows) are in this data frame?
nrow(data)

# Question 14 : Extract the last 2 rows of the data frame and print them to the console. 
# What does the output look like?
data[152:153,]
nrow(data)
my_seq <- (nrow(data)-1):nrow(data)
my_seq
data[my_seq,]
data[(nrow(data)-1):nrow(data),]
my_seq <- seq((nrow(data)-1),nrow(data),1)
my_seq
# Question 15 : What is the value of Ozone in the 47th row? 
data[47,"Ozone"]

# Question 16 : How many missing values are in the Ozone column of this data frame?
# premiere methode
missing <- is.na(data[,"Ozone"])
missing
nrow(data[missing,])
# methode 2
missing2 <- is.na(data$Ozone)
missing2
length(data$Ozone[missing2])
# methode 3
table(data$Ozone, useNA = "always") 
# Methode 4 - the best
sum(is.na(data$Ozone))


# Question 17 : What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(data$Ozone, na.rm = TRUE)
summary(data)

# Question 18 : Extract the subset of rows of the data frame 
# where Ozone values are above 31 
# and Temp values are above 90. 
# What is the mean of Solar.R in this subset?
subdata <- data[ data[,"Ozone"]>31 & data[,"Temp"]>90, ]
head(subdata)
nrow(subdata)
mean(subdata$Solar.R, na.rm = TRUE)

# Question 19 : What is the mean of "Temp" when "Month" is equal to 6?
mean(data$Temp[data[,"Month"]==6], na.rm = TRUE)

# Question 20 : What was the maximum ozone value in the month of May (i.e. Month = 5)?
max(data$Ozone[data[,"Month"]==5], na.rm = TRUE)

# ----------------------------------------------------------
# SWIRL R Programming 2: Workspace and Files
# ----------------------------------------------------------
old.dir <- getwd()
old.dir
list.files() # equivalent de dir()
args(list.files) # function on a function name
str(list.files)
help(dir.create)
getwd()
dir.create("testdir")
setwd("testdir")
getwd()
file.create("mytest.R")
file.exists("mytest.R")
file.info("mytest.R")
class(file.info("mytest.R"))
names(file.info("mytest.R"))
file.info("mytest.R")$size
file.rename("mytest.R","mytest2.R")
file.remove("mytest.R")
file.copy("mytest2.R","mytest3.R")
file.path("mytest3.R")
file.path("testdir2","testdir3")
help(file.path)
dir.create(file.path("testdir2","testdir3"), recursive = TRUE) # comme UNIX avec -p
unlink("testdir2", recursive = TRUE) # pour detruire un repretoire (qui contient qqch avec ce qu'il contient)
unlink("testdir", recursive = TRUE)

# ----------------------------------------------------------
# SWIRL R Programming 3: Sequences of Numbers
# ----------------------------------------------------------
1:20
pi:10 # The result is a vector of real numbers starting with pi (3.142...) and
      # increasing in increments of 1,The upper limit of 10 is never reached
15:1
15:12
15:pi
pi:1
?`:`
seq(0,10, by=0.5)
seq(5,10, by=1.5)
seq(pi,10, by=1.5)
seq(10,0, by=-0.5)
seq(10,pi, by=-1.5)

my_seq <-seq(5, 10, length=30)
my_seq
length(my_seq)
seq(pi,10, length=2)
seq(pi,10, length=5)
seq(pi,10, length=1)

1:length(my_seq)
x <- 5
1:x
seq(along.with = my_seq)
seq(along.with = c(10,3,4)) # prend la taille du vecteur argument
my_seq <-seq(5, 10, along.with = c(10,3,4))
my_seq
help(seq)
seq(pi,10, length=x)
seq_along(my_seq)

rep(0, times = 40)
rep(c(0, 1, 2), times = 10)
rep(c(0, 1, 2), each = 10)
help(rep)
# ----------------------------------------------------------
# SWIRL R Programming 4: Vectors
# ----------------------------------------------------------
# two different flavors: atomic vectors and lists
# Logical vectors can contain the values TRUE, FALSE, and NA

num_vect <- c(0.5,55,-10,6)
tf <- num_vect < 1
tf
num_vect >= 6
# logical operators == != <=, ..
# A | B
# A & B
# !A 
(3 > 5) & (4 == 4)
((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)

my_char <- c("My","name","is")
my_char
paste(my_char, collapse = " ") # le s??parateur pour concatener
paste(my_char, collapse = "x")
paste(my_char, collapse = "")
my_name <- c(my_char, "Greg")
my_name
paste(my_name, collapse = " ") # si 1 seul vecteur en arg donc conc...
paste("Hello", "world!", sep = " ")
paste(1:3, c("X", "Y", "Z"), sep = "") # si deux, ... element a elt...
paste(c("X", "Y", "Z"), c("X", "Y", "Z"), sep = "") # si deux, ... element a elt...
paste(c("X", "Y", "Z","X", "Y", "Z"), sep = "") # si deux, ... element a elt...


LETTERS
paste(LETTERS, 1:4, sep = "-") # recycling vector petit...

# ----------------------------------------------------------
# SWIRL R Programming 5: Missing Values
# ----------------------------------------------------------
# NA is used to represent any value that is 'not available'

x <- c(44, NA, 5, NA)
x*3

# 1000 draws from a standard normal distribution with y <- rnorm(1000)
y <- rnorm(1000)
hist(y)
z <- rep(NA, 1000)

my_data <- sample(c(y, z), 100) # Selection de 100 elements au hasard dans un vecteur

v <- c("a","b","c","d")
test <- sample(v, 3) # Selection 3 au hasard dans un vecteur (sans repetition)
test <- sample(v, 5) # Selection de 100 elements au hasard dans un vecteur
test



hist(my_data)
my_na <- is.na(my_data)
my_na
my_data == NA # NA is not really a value !!!!
class(my_data == NA) # Logical cependant...

sum(my_na) # R represents TRUE as the number 1 and FALSE as the number 0

# NaN, which stands for 'not a number'
0/0
Inf-Inf

# ----------------------------------------------------------
# SWIRL R Programming 6: Subsetting Vectors
# ----------------------------------------------------------

# placing an 'index vector' in square brackets
y <- rnorm(20)
z <- rep(NA, 20)
x <- sample(c(y, z), 40) # Selection de 40 elements au hasard dans un vecteur
x
x[1:10]

# index vectors come in four different flavors -- 
# - logical vectors, 
# - vectors of positive integers, 
# - vectors of negative integers, 
# - vectors of character
x[is.na(x)] # donne les NA
x[!is.na(x)]
y <- x[!is.na(x)]
y
y[y > 0]
x[x > 0] # NA > 0 evaluates to NA
x > 0

x[!is.na(x) & x > 0]

# R uses 'one-based indexing' le premier element est [1] indice 1 et non 0...
x[c(3,5,7)]
x[0]
x[3000]

x[c(2, 10)]
x[c(-2, -10)] # Tous les ??l??ments sauf les 2 et 10...
x[-1000] # ....
x[-c(2,10)] # Idem x[c(-2, -10)]

vect <- c(foo = 11, bar = 2, norf = NA)
vect
names(vect)

vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")
identical(vect,vect2)

vect[c("foo", "bar")]

# ----------------------------------------------------------
# SWIRL R Programming 7: Matrices and Data Frames
# ----------------------------------------------------------

my_vector <- 1:20
my_vector
dim(my_vector) # NULL
length(my_vector)

dim(my_vector) <- c(4, 5)
dim(my_vector)
attributes(my_vector)
class(my_vector) # estdevenu une "matrix" avec l'attribut dim
my_vector
my_matrix <- my_vector
# matrix is simply an atomic vector with a dimension attribute
?matrix
my_matrix2 <- matrix(1:20, 4, 5)
identical(my_matrix,my_matrix2)

patients <- c("Bill", "Gina", "Kelly","Sean")
cbind(patients,my_matrix)
# matrices can only contain ONE class of data !!!! conversion carac...


my_data <- data.frame(patients, my_matrix)
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames
my_data
class(my_data)
# ----------------------------------------------------------
# SWIRL R Programming 8: Logic
# ----------------------------------------------------------

TRUE == TRUE
(FALSE == TRUE) == FALSE
6 == 7
6 < 7

# logical operators == < , !=, ...

!( 5 == 7 )

# There are two AND operators in R, `&` and `&&`
# dif.....


TRUE & c(TRUE, FALSE, FALSE)
c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE)

TRUE && c(TRUE, FALSE, FALSE) # the left operand is only evaluated with the first member
c(TRUE, TRUE, TRUE) && c(TRUE, FALSE, FALSE)
c(F, TRUE, TRUE) && c(TRUE, FALSE, FALSE)
c(F, TRUE, TRUE) && c(TRUE)

# OR | across a vector et || firts element
# vectorised version
TRUE | c(TRUE, FALSE, FALSE)
# non vectorised version
TRUE || c(TRUE, FALSE, FALSE)


6 != 10 && FALSE && 1 >= 2
TRUE || 5 < 9.3 || FALSE
# R??gles de priorit??
# AND operators are evaluated before OR operators

5 > 8 || 6 != 8 && 4 > 3.9
5 > 8 || (6 != 8 && 4 > 3.9 )

TRUE && FALSE || 9 >= 4 && 3 < 6
TRUE && 62 < 62 && 44 >= 44
6 >= -9 && !(6 > 7) && !(!TRUE)
FALSE || TRUE && 6 != 4 || 9 > 4
!(8 > 4) ||  5 == 5.0 && 7.8 >= 7.79
FALSE || TRUE && 6 != 4 || 9 > 4
!(8 > 4) ||  5 == 5.0 && 7.8 >= 7.79
6 >= -9 && !(6 > 7) && !(!TRUE)
FALSE && 6 >= 6 || 7 >= 8 || 50 <= 49.5


isTRUE(6 > 4)
isTRUE(3)
!isTRUE(4 < 3)


identical('twins', 'twins')
identical('hello', 'Hello')
identical(5 > 4, 3 < 3.1)


# xor() function exclusive OR
xor(5 == 6, !FALSE)
xor(!isTRUE(TRUE), 6 > -1)
xor(4 >= 9, 8 != 8.0)
xor(4 <= 9, 8 == 8)

ints <- sample(10)
ints
sample(20) # random sampling of integers from 1 to 20 without replacement

help(sample)

which(c(TRUE, FALSE, TRUE))
which(ints > 5) # retourne les indices des valeurs TRUE
# prend en param??tre un vecteur logique..retourne un vecteur integer
# interessant pour faire des boucles sur parties...

any(ints<0) # retourne TRUE si l'un au moins des elt du vect est TRUE
all(ints>0) # retourne TRUE tous les elt du vect sont TRUE

any(ints == 2.5)
all(ints == 10)
all(c(TRUE, FALSE, TRUE))
any(ints == 10)

# ----------------------------------------------------------
# SWIRL R Programming 9: Functions
# ----------------------------------------------------------
# can be treated like any other R Objects
Sys.Date()
mean(c(2, 4, 5))



# You're about to write your first function! Just like you would assign a value 
# to a variable with the assignment operator, you assign functions in the following
# way:
#
# function_name <- function(arg1, arg2){
#  # Manipulate arguments in some way
#	# Return a value
# }
#
# The "variable name" you assign will become the name of your function. arg1 and
# arg2 represent the arguments of your function. You can manipulate the arguments
# you specify within the function. After sourcing the function, you can use the 
# function by typing:
# 
# function_name(value1, value2)

boring_function <- function(x) {
  x
}

boring_function('My first function!')
class('My first function!')

boring_function
mean

help(sum)
my_mean <- function(my_vector) {
  sum <- sum(my_vector, na.rm = TRUE)
  # lenght - non missing value only
  lenght <- sum(!is.na(my_vector))  
  mean <- sum/lenght
  mean
}

my_mean(c(2, 4, 5, NA))

# modulus operator %% to find the remainder

remainder <- function(num, divisor = 2) {
  num %% divisor 
}

remainder(3)
remainder(5,3)
# explicitly specify arguments
remainder(divisor = 11, num = 5)
remainder(11,5)
remainder(5,11)

# R can also partially match arguments
remainder(4, div = 2)


args(remainder) # Pour voir les arguments



# You can pass functions as arguments to other functions just like you can pass
# data to functions. Let's say you define the following functions:
#
# add_two_numbers <- function(num1, num2){
#    num1 + num2
# }
#
# multiply_two_numbers <- function(num1, num2){
#  num1 * num2
# }
#
# some_function <- function(func){
#    func(2, 4)
# }
#
# As you can see we use the argument name "func" like a function inside of 
# "some_function()." By passing functions as arguments 
# some_function(add_two_numbers) will evaluate to 6, while
# some_function(multiply_two_numbers) will evaluate to 8.
# 
# Finish the function definition below so that if a function is passed into the
# "func" argument and some data (like a vector) is passed into the dat argument
# the evaluate() function will return the result of dat being passed as an
# argument to func.
#
# Hints: This exercise is a little tricky so I'll provide a few example of how
# evaluate() should act:
#    1. evaluate(sum, c(2, 4, 6)) should evaluate to 12
#    2. evaluate(median, c(7, 40, 9)) should evaluate to 9
#    3. evaluate(floor, 11.1) should evaluate to 11

evaluate <- function(func, dat){
  # Write your code here!
  func(dat)
  # Remember: the last expression evaluated will be returned! 
}


evaluate(mean, c(1,2,3,4))
evaluate(sum, c(1,2,3,4))
evaluate(max, c(1,2,3,4))

evaluate(sd,c(1.4, 3.6, 7.9, 8.8))

evaluate(function(x){x+1}, 6)
evaluate(function(x){x[1]}, c(8, 4, 0))
evaluate(function(x){x[length(x)]}, c(8, 4, 0))
# anonymous function


# The ellipses can be used to pass on arguments to other functions that are
# used within the function you're writing. Usually a function that has the
# ellipses as an argument has the ellipses as the last argument. The usage of
# such a function would look like:
#
# ellipses_func(arg1, arg2 = TRUE, ...)
#
# In the above example arg1 has no default value, so a value must be provided
# for arg1. arg2 has a default value, and other arguments can come after arg2
# depending on how they're defined in the ellipses_func() documentation.
# Interestingly the usage for the paste function is as follows:
#
# paste (..., sep = " ", collapse = NULL)
#
# Notice that the ellipses is the first argument, and all other arguments after
# the ellipses have default values. This is a strict rule in R programming: all
# arguments after an ellipses must have default values. Take a look at the
# simon_says function below:
#
# simon_says <- function(...){
#   paste("Simon says:", ...)
# }
#
# The simon_says function works just like the paste function, except the
# begining of every string is prepended by the string "Simon says:"
#
# Telegrams used to be peppered with the words START and STOP in order to
# demarcate the beginning and end of sentences. Write a function below called 
# telegram that formats sentences for telegrams.
# For example the expression `telegram("Good", "morning")` should evaluate to:
# "START Good morning STOP"

telegram <- function(...){
  paste("START", ...,"STOP")
}
telegram("test","test2")
telegram(c("test","test2"))

telegram <- function(arg1, arg2 = "arg2", ..., argn = "z"){
        paste("START", arg1, arg2,...,"STOP",argn)
}
telegram("test","test2")
telegram("test")
telegram("test","test2") # test 2 est donc consid??r?? comme le deuxi??me arg
telegram(",a",arg2 ="test")
telegram("test","test2", argn = "OOO")
telegram("test","test2", "OOO")
telegram("test","test2", argn = "OOO", arg2 = "arg2") # test2 est consid??r?? ...

telegram("test","test2")
telegram(c("test","test2"),"a")



# Let's explore how to "unpack" arguments from an ellipses when you use the
# ellipses as an argument in a function. Below I have an example function that
# is supposed to add two explicitly named arguments called alpha and beta.
# 
# add_alpha_and_beta <- function(...){
#   # First we must capture the ellipsis inside of a list
#   # and then assign the list to a variable. Let's name this
#   # variable `args`.
#
#   args <- list(...)
#
#   # We're now going to assume that there are two named arguments within args
#   # with the names `alpha` and `beta.` We can extract named arguments from
#   # the args list by used the name of the argument and double brackets. The
#   # `args` variable is just a regular list after all!
#   
#   alpha <- args[["alpha"]]
#   beta  <- args[["beta"]]
#
#   # Then we return the sum of alpha and beta.
#
#   alpha + beta 
# }
#
# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.

mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

mad_libs(place = "Paris", adjective = "qwer", noun = "nom")


mad_libs2 <- function(...){
        # Do your argument unpacking here!
        args <- list(...)
        place <- args$place
        adjective <- args$adjective
        paste("News from", place, "today where", adjective, "students took to the streets in protest of the new...")
}
mad_libs(place = "Paris", adjective = "qwer", noun = "nom")

# define your own binary operators

# The syntax for creating new binary operators in R is unlike anything else in
# R, but it allows you to define a new syntax for your function. I would only
# recommend making your own binary operator if you plan on using it often!
#
# User-defined binary operators have the following syntax:
#      %[whatever]% 
# where [whatever] represents any valid variable name.
# 
# Let's say I wanted to define a binary operator that multiplied two numbers and
# then added one to the product. An implementation of that operator is below:
#
# "%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
#   left * right + 1
# }
#
# I could then use this binary operator like `4 %mult_add_one% 5` which would
# evaluate to 21.
#
# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

"%p%" <- function(left, right){ # Remember to add arguments!
  paste(left,right)
}
"aaa" %p% "bbb"
"I" %p% "love" %p% "R!"

