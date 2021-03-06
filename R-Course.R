#R-Course.pdf -- Peter Haschke - An Introduction to R

#Chapters 1, 2
x=4
y=sin(x)
plot(x, sin(x))
factorial(100)

3^8

n=8
k=4
(choose(n, k-2)*3^(n-k))/k
(3^(n-k)*factorial(n))/(factorial(k)*factorial(n-k))

#P(Г+,--)
(1/3)^4+(1/3)^2*6*(2/3)^2+(2/3)^4
#usl ver
(1/9)/((1/3)^4+(1/3)^2*6*(2/3)^2+(2/3)^4)

((1/3)^3+4/9)/3

(1/3)^4+(1/3)^2*3*(2/3)^2

((1/3)^3+(1/3)*3*(2/3)^2)#/(1/3)^4+(1/3)^2*6*(2/3)^2+(2/3)^4

(1/3)*((1/3)^4+(1/3)^2*6*(2/3)^2+(2/3)^4)
1/3*3
24017/(6^7)

28/(6^7)
7/69984
11623/34992

(3.5)^5*((3.5)^5-1)/(2.5)

(1/6)^21

factorial(6)*(3^3/6^24)
factorial(10)*((1/6)^7)*(5/6)^17

(1/(32*31*30*29))*(4*3*2*1+3*2*21+3*2*33+3*2*8+6*7+3*2*21*20+3*2*8*20+2*23*22)

(8*3*2)/(32*31*30*29)

(choose(30,7)*choose(23,7)*choose(16,7)*9)/4^30
choose(24,9)/choose(32,17)

6^3
0.9*3.08+3
4/0.9
64+16+20+8+5+1
40+10+2
6
114+52+6
172-216

#So far - R used as a calculator for aritmetic and logical operations.



#Chapter 3
#objects and modes
#R is an object oriented language
#Everything in R is an object

#3.1
#Basic objects:
#Vectors; Matrices and Arrays; Lists (don't have to contain elements of the same mode, unlike vectors);
#Data Frames (special matrices, a type of list; used for most applications involving datasets; They are 2D containers with rows -> observations, columns -> variables)
#Factors - vectors used to classify categorical data
#Functions - they are objects and take other objects as inputs and return some new object.

#3.2 Modes in R
#integer (Z); numeric (R); complex (C); character (text); logical (T/F).

#3.3 Assignment and Reference
#give things names and recall them later
#assign: <-
#use descriptive names
#is(A) gives us what type of object A is, and its mode
A <- 3+1
A
print(A)
is(A)
A2 <- A*sqrt(A)
A2
ls() #shows all objects we have created that are stored in Active memory

#Creating vectors - with c() (concatenate)
vector1 <- c(1,2,4,5,8)
vector1
vector2 <- c("abc", "d12f", "42" )
vector2
vector3 = c(1,3,4,7)
log(vector1)
round(log(vector1))
round(log(vector1), digit=2)
sum(vector1,vector3)
prod(vector1,vector3)
prod(vector1)*prod(vector3)
min(vector1)
mean(vector3)
median(vector3)
range(vector3)
sd(vector1)
vector4<-c(45,0,2,5,1)
cov(vector1, vector4)
cor(vector1, vector4)
var(vector1, vector4)
var(vector1)
summary(vector4)
unique(vector1)
vector5=c(1,1,2,3,4)
unique(vector5)

#Simpligying vector creation
1:10
1:100
randu
seq(from =0, to=10, by=3)
rep(1, time=10)
rep(vector1, 3)
rep(vector2, each=2)

#Indexing
vector2[2]
vector1[1:3]
vector2[2] <- "hh"
vector2

#More functions
foo <- c (2 , 3 , 4 , 3 , NA , NA , 6 , 6 , 10 , 11 , 2 , NA , 4 , 3)
summary(foo)
max(foo)
na.omit(foo)
max(na.omit(foo))

#subsets
X <- 1:500
Multiple7 <- subset(X, X%%7==0)
Multiple7
sample ( Multiple7 , size = 10 , replace = FALSE )

#print, cat, paste functions
x<-0.2
print(x)
paste(x, "=", x) #creates an implicit object - a character vector
cat(x, "=", x) #does similar as paste, but does not create an object in the computer's active memory



#Chapter4
#4.1 Maintaining code and objects

rm(list = ls()) # remove all objects from active memory
# Create two vectors
X <-c (1 ,2 ,3 ,4 ,5)
Y <-c (5 ,4 ,3 ,2 ,1)
# Do some maths
Z <- X - Y
MEAN.Z <- mean(Z)
MIN.Z <- min(Z)
# This finds the smallest element
MAX.Z <- max(Z)
# This finds the largest element

#4.1.1 Scripting
#source("filepathandname")
ls()

#4.1.3 Saving and loading objects
save(X,Y,Z,MEAN.Z, file="/home/tsveti/Documents/1_PS/1probstat/R/R-Course/RCourse.RData")
rm(list=ls())
ls()
load("/home/tsveti/Documents/1_PS/1probstat/R/R-Course/RCourse.RData")
ls()

#4.2 Creating Matrices

M=matrix(data=c(1,2,3,1,5,0,0,1,100), nrow=3, ncol=3)
dim(M)

#examples
Vector8 <- 1:12
Vector8
Matrix3 <- matrix ( data = Vector8 , nrow = 4)
Matrix3 # by default the matrix will be populated by column
Matrix4 <- matrix ( data = Vector8 , nrow = 4 , byrow = TRUE )
Matrix4 # now we populated it by row

#creating matrices by using rbind() and cbind() functions:
Vector9 <- 1:10
Vector9
Vector10 <- Vector9 ^ 2
Vector10
Matrix5 <- rbind(Vector9, Vector10)
Matrix5
dim(Matrix5)

Matrix6 = cbind(Vector9, Vector10, Vector9)
dim(Matrix6)
Matrix6
colnames(Matrix6)
rownames(Matrix6)
#Let's set row names and column names:
colnames(Matrix6) = c("A", "B", "C")
rownames(Matrix6) = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "potato")
Matrix6    

IdMat = diag(4) #an identity matrix
IdMat

v1=c(1,2,3); M8 = diag(v1) #v1 across the diagonal
M8

diag(IdMat)  #extracts the diagonal from the matrix

#4.2.1 Indexing matrices

M9 = matrix(runif(15, 0, 200), 3, 5)
M9
M9[2,5]
M9[,5] 
M9[1,]
M9[,1:3]
M9[M9[,2] >175, ] # extracts all rows that in their second column contain values greater than four
M9


#4.3 Mathematical Operations
M10=matrix(rnorm(15, 0, 1), 3, 5)
M10
t(M10) #transpose
M11=matrix(rnorm(15, 0, 1), 3, 3)
M11
solve(M11) #inverse
det(M11)
eigen(M11) #eigenvalues and eigenvectors (it returns a list containing a vector and a matrix)
crossprod(M10, M11)
M10%x%M11 #kronecker product

sum(diag(M11)) #trace

#We can extract named elements from a list with the $ symbol, or with [[ ]].
eigen.list = eigen(M11)
names(eigen.list)
eigen.list$values
eigen.list$vectors


#4.3.2 bonus example
Constant <- rep (1 , times = 10)
Variable <- c (1 ,2 ,3 ,1 ,2 ,3 ,5 ,6 ,7 ,8)
X <- cbind(Constant, Variable)
X
Y <- seq(1, 10)
Y
Beta.Hats <- solve(t(X)%*%X) %*% t(X)%*%Y
colnames(Beta.Hats) <- "Estimate"
Beta.Hats



#Chapter 5 - Data Frames





