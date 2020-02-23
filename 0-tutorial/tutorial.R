## Tutorial on R, the statistical programming language
## author: Ruda Zhang <rzhang@samsi.info>
## date: 2020-02-24

## Operators: algebraic
3 + 2
3 - 2
3 * 2
3 / 2
3^2

## Operators: logical
3 > 2
3 >= 2
3 == 2
3 != 2

## Creating new variables
x <- 1
x

## Data types: atomic
typeof(x)
x <- 1L
typeof(x)
x <- pi
typeof(x)

## Vectors
x <- 1:3
x
## Concatenate
y <- c(4, 5, 6, 7)
## Subsetting
y[1]
y[-1]
y[c(1,4)]
y[-c(1,4)]
z <- c(y[c(1,4)], y[-c(1,4)])
z

## Class
## Matrix
a <- seq(1, 9, length.out = 9)
A <- matrix(a, nrow = 3, ncol = 3)
A
typeof(A)
class(A)
## Subsetting
A[1:2, 1]
A[1:2, c(1,2)]
A[1:2, ]

## Array
b <- seq(1, 8, by=1)
B <- array(data=b, dim=c(2,2,2))
B
class(B)
B1 <- B[ , , 1]
B2 <- B[ , , 2]
C <- cbind(B1, B2)
C

## Data frame
df <- data.frame(x = c(1, 5, 6), y = c(2, 4, 3))
df
class(df)
df$x
df$y

## List
l1 <- list(1, 2, 3)
l1
class(l1)
names(l1) <- c("a", "b", "c")
l1
## Access
l1[[1]]
l1$a
l1$a <- 4
l1$a

## Linear Algebra
A <- matrix(c(2, 3, 1, 5), nrow=2, ncol=2)
## transpose
t(A)
## matrix addition
B <- matrix(c(2, 2, 3, 5), nrow=2, ncol=2)
A + B
## matrix multiplication
A %*% B
### elementwise multiplication
A * B

## solve the system Ax = b
A <- matrix(c(2, 1, 1, 5), nrow=2, ncol=2)
b <- c(1,2)
solve(A, b)
## compute Cholesky decomposition
R <- chol(A)
## use triangular solvers
backsolve(R, backsolve(R, b, transpose=TRUE))

## Importing Data
## load the buit-in R data "Orange"
data("Orange")
head(Orange)
names(Orange)
## save the data into local disk.
Tree <- Orange$Tree
age <- Orange$age
circ <- Orange$circumference
# save three vectors into the .RData format
save(Tree, age, circ, file="mydata.RData")
# save circumference into the .csv format
write.csv(circ, file="mydata.csv")
# load the csv file again
mycirc <- read.csv(file="mydata.csv")

## Function
mysquare <- function(x){
  y <- x^2    ## main body of the function
  return(y)  ## return variable y
}
y1 <- mysquare(3)
y1

## Packages
## Install from repository
install.packages(c("mvtnorm", "plotrix"))
## load packages
library(mvtnorm)
library(plotrix)
